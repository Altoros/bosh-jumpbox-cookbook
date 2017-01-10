FROM ubuntu:xenial

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates curl wget git jq \
	&& rm -rf /var/lib/apt/lists/*

ENV DUMB_INIT_VERSION 1.2.0
RUN wget -q -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 \
    && chmod +x /usr/local/bin/dumb-init
