FROM golang:latest
RUN apt update -y
RUN git clone https://github.com/meganz/sdk.git sdk && cd sdk && \
    git checkout v4.2.0 && ls -l
RUN cd contrib && bash build_sdk.sh
