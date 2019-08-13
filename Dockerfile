FROM debian:buster

RUN apt-get update -y && apt-get install -y \
	xutils-dev \
	autoconf \
	automake \
	make \
	gcc \
	pkg-config \
	libx11-dev \
	x11proto-dev

RUN mkdir build
COPY . build/

WORKDIR build

RUN autoreconf -i
RUN automake

RUN ./configure
RUN make
