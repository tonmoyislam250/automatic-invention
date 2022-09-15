FROM golang:latest
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update -y && apt-get install -y gcc g++ libtool-bin unzip patch \
    libcurl4-openssl-dev libc-ares-dev libsodium-dev libsqlite3-dev build-essential zlib1g-dev libcrypto++-devlibssl-dev autoconf m4 make wget
RUN git clone https://github.com/meganz/sdk.git sdk && cd sdk && \
    git checkout v3.12.2 && ls -a && pwd
RUN cd /go/sdk/contrib && cp build_sdk.sh /go/sdk
RUN cd /go/sdk/ && bash build_sdk.sh -e -g -f -a -q -u
 
