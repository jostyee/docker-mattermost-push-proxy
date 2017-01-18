FROM alpine:3.4
MAINTAINER jostyee <hi@syntaxoff.com>

ENV MATTERMOST_VERSION=3.5 \
	MATTERMOST_BUILD_DIR="/build"

COPY assets/build/ ${MATTERMOST_BUILD_DIR}/

# Use dl-3, as the cdn hosted on fastly.net, which has been blocked in China
RUN sed -i -e 's/dl-cdn/dl-5/' /etc/apk/repositories \
	&& apk --update add ca-certificates \
	&& apk add --no-cache --virtual build-dependencies go wget bash \
	&& update-ca-certificates \
	&& bash ${MATTERMOST_BUILD_DIR}/install.sh \
	&& apk del build-dependencies

EXPOSE 8066
ENTRYPOINT ["/mattermost-push-proxy"]