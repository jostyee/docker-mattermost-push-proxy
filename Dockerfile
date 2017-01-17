FROM sameersbn/ubuntu:14.04.20170110
MAINTAINER jostyee <hi@syntaxoff.com>

ENV APP_DIR="/opt/mattermost-push-proxy"

RUN wget --quiet -O mattermost.tar.gz https://github.com/mattermost/mattermost-push-proxy/releases/download/v3.5/mattermost-push-proxy-3.5.0.tar.gz \
	&& mkdir -p ${APP_DIR} \
	&& tar -xf mattermost.tar.gz -C ${APP_DIR} --strip 1 \
	&& chmod +x ${APP_DIR}/bin/mattermost-push-proxy \
	&& rm mattermost.tar.gz

COPY assets/runtime/entrypoint.sh .
RUN chmod +x ./entrypoint.sh

EXPOSE 8066
ENTRYPOINT ["/entrypoint.sh"]