FROM frolvlad/alpine-glibc:alpine-3.5
MAINTAINER jostyee <hi@syntaxoff.com>

COPY ./push-proxy /push-proxy

# Use dl-5, as the cdn hosted on fastly.net, which has been blocked in China
RUN sed -i -e 's/dl-cdn/dl-5/' /etc/apk/repositories \
	&& apk add --no-cache ca-certificates\
	&& chmod +x /push-proxy

EXPOSE 8066
ENTRYPOINT ["/push-proxy"]
