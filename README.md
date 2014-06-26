docker-centos-mono
==================

A minimal CentoOS 6 image based off Docker's offical CentOS 6 image and mono compiled from the latest source

I was originally using the centos:6.4 tag for stability, however this is a somewhat large image (300MB~) and has since been stripped down (175MB~) so I'm going to use the wider centos:centos6 tag which presumably will be updated more often. Once there is a new more stable minimal tag, I'l switch back to a specific version.

mono-mini branch
==================

The goal of this branch is really just to get the most compact, minimal installation that of mono that can run most common applications out of the box.

I will most likely move the whole project to this branch eventually and intend for the image to be primarily used for web servers and long running processes

mono install
==================

mono is installed to the /usr prefix

Documentation generation is disabled (--with-mcs-docs=no)

A number of potentially unneeded features are removed at compile time using the configure switch:
`--enable-minimal=aot,profiler,pinvoke,debug,reflection_emit,logging,com`

It's possible that reflection_emit and pinvoke need to be taken off this list but will wait until that is neccessary. The rest of the flags are for development or distribution purposes.

See the Minimal Mono section of the mono documentation for more info: http://www.mono-project.com/Unsupported_Advanced_Mono_Compile_Options#Minimal_Mono

