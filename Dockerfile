# Base OS
FROM centos:centos7
MAINTAINER shaunol

# Env setup
ENV HOME /root
WORKDIR ~/

# Build deps
RUN yum install -y git make autoconf libtool gcc-c++ which gettext tar wget unzip


RUN rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
RUN yum -y install yum-utils
RUN yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
RUN yum -y install mono-complete
RUN mozroots --import --sync

# Tidy up build dependencies
# TODO: It sucks that I have to manually remove perl, which was included by autoconf, so investigate a way to remove these dependencies automatically
#		I'm sure there's some yum command for it
RUN yum remove -y git make autoconf libtool gcc-c++ tar wget unzip perl

