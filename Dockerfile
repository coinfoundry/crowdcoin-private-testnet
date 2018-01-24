FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    https://github.com/crowdcoinChain/Crowdcoin/releases/download/1.1.0/Crowdcoin_command_line_binaries_linux_1.1.tar.gz \
    /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    apt-get update -y && apt-get install software-properties-common -y && \
    add-apt-repository ppa:bitcoin/bitcoin && apt-get update -y && \
    apt-get install -y --no-install-recommends libzmq5 libboost-system-dev libboost-filesystem-dev \
    libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libevent-pthreads-2.0-5 libevent-2.0-5 && \
    cd /tmp && tar xvf Crowdcoin_command_line_binaries_linux_1.1.tar.gz && cp -r /tmp/Crowdcoin*/* /usr/bin && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 16301 16302 16303

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
