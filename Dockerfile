# Base OS
FROM centos:centos7
MAINTAINER shaunol

# Env setup
ENV HOME /root
WORKDIR ~/

# Build deps
RUN yum install -y git make autoconf libtool gcc-c++ which gettext tar wget unzip

# Mono install
# monolite is coming from my dropbox because the xamarin cdn is unreliable
RUN git clone git://github.com/mono/mono ~/mono && \
	cd ~/mono && \
	./autogen.sh --prefix=/usr --with-mcs-docs=no --enable-minimal=aot,profiler,pinvoke,debug,logging,com && \
	make monolite_url=https://dl.dropbox.com/s/z00qa9cmbymjjlz/monolite-111-latest.tar.gz get-monolite-latest && \
	make CFLAGS=-Os && \
	make install && \
	strip /usr/bin/mono && \
	cd ~/ && \
	rm -rf ~/mono

# Tidy up build dependencies
# TODO: It sucks that I have to manually remove perl, which was included by autoconf, so investigate a way to remove these dependencies automatically
#		I'm sure there's some yum command for it
RUN yum remove -y git make autoconf libtool gcc-c++ tar wget unzip perl