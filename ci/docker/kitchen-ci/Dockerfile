FROM ubuntu:xenial

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates curl wget git jq \
    && rm -rf /var/lib/apt/lists/*

ENV CHEF_DK_VERSION 1.0.3
RUN wget -q -O chefdk.deb https://packages.chef.io/files/stable/chefdk/${CHEF_DK_VERSION}/debian/8/chefdk_${CHEF_DK_VERSION}-1_amd64.deb \
    && dpkg -i chefdk.deb \
    && rm chefdk.deb

RUN chef gem install kitchen-ec2 kitchen-docker

ENV DUMB_INIT_VERSION 1.2.0
RUN wget -q -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 \
    && chmod +x /usr/local/bin/dumb-init


