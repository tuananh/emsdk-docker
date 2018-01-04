FROM debian:jessie-slim

LABEL maintainer "Tuan Anh Tran <me@tuananh.org>"

RUN apt-get update \
    && apt-get install git cmake clang build-essential ca-certificates python -y --no-install-recommends

RUN git clone https://github.com/juj/emsdk.git \
    && cd emsdk \
    && ./emsdk install latest \
    && ./emsdk activate latest \
    && source ./emsdk_env.sh