# Matrix User Verification Service

![Build, scan & push](https://github.com/Polarix-Containers/matrix-user-verification-service/actions/workflows/build.yml/badge.svg)

### Features & usage
- Drop-in replacement for the [official image](https://github.com/element-hq/synapse/tree/develop/docker).
- Built against the master branch since upstream has not made a release in a long time.
- Unprivileged image: you should check your volumes' permissions (eg `/data`), default UID/GID is 200016.

### Licensing
- Licensed under the Apache license. 😇
- Copyright to the Matrix User Verification Service belongs to the Matrix Foundation.
- Any image built by Polarix Containers is provided under the combination of license terms resulting from the use of individual packages.
