FROM golang:latest
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update -y && apt-get install -y gcc g++ libtool-bin unzip patch \
    libcurl4-openssl-dev libc-ares-dev libsodium-dev libsqlite3-dev build-essential zlib1g-dev libcrypto++-dev libssl-dev autoconf m4 make wget
RUN git clone https://github.com/meganz/sdk.git sdk && cd sdk && \
    git checkout v3.12.2 && ls -a && pwd
RUN sh autogen.sh && \
    ./configure --disable-examples --disable-shared --enable-static --without-freeimage && \
    make -j$(getconf _NPROCESSORS_ONLN) && \
    make install
