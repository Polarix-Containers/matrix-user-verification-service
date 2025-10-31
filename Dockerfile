ARG NODE=22
ARG UID=200016
ARG GID=200016


FROM node:${NODE}-alpine

LABEL maintainer="Thien Tran contact@tommytran.io"

ARG UID
ARG GID

ENV UVS_LISTEN_ADDRESS=0.0.0.0

RUN apk -U upgrade \
    && apk add build-base \
    && npm update -g npm

RUN --network=none \
    addgroup -g ${GID} uvs \
    && adduser -u ${UID} --ingroup uvs --disabled-password --system uvs

WORKDIR /app

ADD https://github.com/matrix-org/matrix-user-verification-service.git /app
RUN npm install --only=production

COPY --from=ghcr.io/polarix-containers/hardened_malloc:latest /install /usr/local/lib/
ENV LD_PRELOAD="/usr/local/lib/libhardened_malloc.so"

USER uvs

EXPOSE 3000

CMD ["node", "src/app.js"]