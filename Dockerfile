FROM golang:latest
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update -y && apt-get install -y gcc g++ libtool-bin unzip patch autoconf mediainfo m4 make wget
RUN git clone https://github.com/meganz/sdk.git sdk && cd sdk && \
    git checkout v4.2.0 && ls -a && pwd
RUN cd /go/sdk/contrib && cp build_sdk.sh /go/sdk
RUN cd /go/sdk/ && bash build_sdk.sh -e -g -f -a -q
