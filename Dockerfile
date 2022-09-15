FROM golang:latest
RUN apt update -y && apt-get install -y gcc g++ libtool-bin unzip autoconf m4 make wget
RUN git clone https://github.com/meganz/sdk.git sdk && cd sdk && \
    git checkout v4.2.0 && ls -a && pwd
RUN cd /go/sdk/contrib && bash build_sdk.sh
