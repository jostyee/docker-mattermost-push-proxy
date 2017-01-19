#!/bin/bash
set -e

MATTERMOST_CLONE_URL=https://github.com/mattermost/mattermost-push-proxy.git

export GOPATH=/go
MATTERMOST_PKG_PATH=${GOPATH}/src/github.com/mattermost
MATTERMOST_BUILD_PATH=${MATTERMOST_PKG_PATH}/mattermost-push-proxy

# create build directories
mkdir -p ${MATTERMOST_PKG_PATH}

# install
echo "Installing mattermost-push-proxy ${MATTERMOST_VERSION}..."
wget -q https://github.com/mattermost/mattermost-push-proxy/archive/v${MATTERMOST_VERSION}.tar.gz
tar -xf v${MATTERMOST_VERSION}.tar.gz -C ${MATTERMOST_PKG_PATH}
mv ${MATTERMOST_PKG_PATH}/mattermost-push-proxy-${MATTERMOST_VERSION} ${MATTERMOST_BUILD_PATH}

echo "Building mattermost-push-proxy..."
cd ${MATTERMOST_BUILD_PATH}
# http://stackoverflow.com/questions/36279253/go-compiled-binary-wont-run-in-an-alpine-docker-container-on-ubuntu-host
GOOS=linux go build -tags netgo -a -o /mattermost-push-proxy

# cleanup build dependencies, caches and artifacts
rm -rf ${GOPATH}
rm -rf /usr/lib/go/pkg
rm -rf ${MATTERMOST_BUILD_DIR}
