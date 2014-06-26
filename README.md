docker-centos-mono
==================

A CentOS image based off Docker's offical CentOS image and mono compiled from the latest source

I will update the master from time to time to reflect new features as they are pushed to mono-master, but in the meantime I will be focusing my efforts mainly on the [mono-mini branch of this repository](https://github.com/shaunol/docker-centos-mono/tree/mono-mini). The mono-mini branch will eventually become the master as I learn more and attempt to build a leaner & more optimized general purpose CentOS based mono image.

I will generally attempt to keep tags around as stable known working images.

Releases
==================

latest/master - based off the centos:6.4 Docker image and the latest mono git master at the time, most mono compile options are left on

centos6.4-mono.xxxxxxx - last tested image release suffixed with the mono git hash at the time of build

mono-mini - based off the centos:centos6 Docker image, a leaner image that will eventually make its way to latest/master