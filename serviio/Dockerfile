#!/bin/bash

# FROM
#
# FROM <image>
# Or
# FROM <image>:<tag>
# Or
# FROM <image>@<digest>
# The FROM instruction sets the Base Image for subsequent instructions. As such, a valid Dockerfile must have FROM as its first instruction. The image can be any valid image – it is especially easy to start by pulling an image from the Public Repositories.
#
# FROM must be the first non-comment instruction in the Dockerfile.
# FROM can appear multiple times within a single Dockerfile in order to create multiple images. Simply make a note of the last image ID output by the commit before each new FROM command.
# The tag or digest values are optional. If you omit either of them, the builder assumes a latest by default. The builder returns an error if it cannot match the tag value.
#
FROM ubuntu:16.04


# MAINTAINER
#
# The MAINTAINER instruction allows you to set the Author field of the generated images.
# MAINTAINER <name>
#
#MANTAINER


# RUN
#
# RUN has 2 forms:
#
# RUN <command> (shell form, the command is run in a shell, which by default is /bin/sh -c on Linux or cmd /S /C on Windows)
# RUN ["executable", "param1", "param2"] (exec form)
# The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile.
#
# Layering RUN instructions and generating commits conforms to the core concepts of Docker where commits are cheap and containers can be created from any point in an image’s history, much like source control.
#
# The exec form makes it possible to avoid shell string munging, and to RUN commands using a base image that does not contain the specified shell executable.
#
# The default shell for the shell form can be changed using the SHELL command.
#
# In the shell form you can use a \ (backslash) to continue a single RUN instruction onto the next line. For example, consider these two lines: RUN /bin/bash -c 'source $HOME/.bashrc ;\ echo $HOME' Together they are equivalent to this single line: RUN /bin/bash -c 'source $HOME/.bashrc ; echo $HOME'
#
#
#RUN apt-get update && apt-get install -y \
# bzr \
# cvs \
# git \
# mercurial \
# subversion
#&& rm -rf /var/lib/apt/lists/*
#
#RUN echo 'deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main' > /etc/apt/#sources.list.d/webupd8team-ubuntu-java-xenial.list \

RUN echo "deb http://archive.ubuntu.com/ubuntu xenial universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu xenial universe multiverse" >> /etc/apt/sources.list

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates multiverse" >> /etc/apt/sources.list

RUN echo "deb http://security.ubuntu.com/ubuntu xenial-security multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://security.ubuntu.com/ubuntu xenial-security multiverse" >> /etc/apt/sources.list


RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get update && apt-get install -y \
 software-properties-common \
&& add-apt-repository -y -u ppa:webupd8team/java \
&& apt-get install -y \
 oracle-java8-installer \
 oracle-java8-set-default \
 build-essential \
 yasm \
 pkg-config \
 libass-dev \
 libfaac-dev \
 libmp3lame-dev \
 libopencore-amrnb-dev \
 libopencore-amrwb-dev \
 librtmp-dev \
 libspeex-dev \
 libtheora-dev \
 libvorbis-dev \
 libx264-dev \
 libxvidcore-dev \
 libx11-dev \
 libx265-dev \
&& rm -rf /var/lib/apt/lists/*

RUN wget https://ffmpeg.org/releases/ffmpeg-3.1.3.tar.xz \
&& tar xf ./ffmpeg-3.1.3.tar.xz

RUN cd ffmpeg-3.1.3/ \
&& ./configure --enable-gpl --enable-version3 --enable-nonfree \
 --enable-postproc --enable-fontconfig --enable-libass \
 --enable-libfaac --enable-libfreetype --enable-libmp3lame \
 --enable-libopencore-amrnb --enable-libopencore-amrwb \
 --enable-librtmp --enable-libspeex --enable-libtheora \
 --enable-libvorbis --enable-libx264 --enable-libxvid \
 --enable-x11grab --enable-libx265 \
&& make && make install

RUN wget http://download.serviio.org/releases/serviio-1.7-linux.tar.gz \
&& tar xzvf serviio-1.7-linux.tar.gz -C /opt \
&& ln -s /opt/serviio-1.7 /opt/serviio

RUN mkdir /media-vol


# CMD
#
# The CMD instruction has three forms:
#
# CMD ["executable","param1","param2"] (exec form, this is the preferred form)
# CMD ["param1","param2"] (as default parameters to ENTRYPOINT)
# CMD command param1 param2 (shell form)
# There can only be one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect.
#
# The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable, or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.
#
#CMD ["perl", "-de0"]
#CMD ["python"]
#CMD [“php”, “-a”]
CMD ["/opt/serviio/bin/serviio.sh"]


# LABEL
#
# LABEL <key>=<value> <key>=<value> <key>=<value> ...
# The LABEL instruction adds metadata to an image. A LABEL is a key-value pair. To include spaces within a LABEL value, use quotes and backslashes as you would in command-line parsing. A few usage examples:
#
#LABEL "com.example.vendor"="ACME Incorporated"
#LABEL com.example.label-with-value="foo"
#LABEL version="1.0"
#LABEL description="This text illustrates \
#that label-values can span multiple lines."


# EXPOSE
#
# EXPOSE <port> [<port>...]
# The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime. EXPOSE does not make the ports of the container accessible to the host. To do that, you must use either the -p flag to publish a range of ports or the -P flag to publish all of the exposed ports. You can expose one port number and publish it externally under another number.
#
#EXPOSE 1194/udp
#EXPOSE 443/tcp
#EXPOSE 80
EXPOSE 8895/tcp 1900/udp 23423


# ENV
#
# ENV <key> <value>
# ENV <key>=<value> ...
# The ENV instruction sets the environment variable <key> to the value <value>. This value will be in the environment of all “descendant” Dockerfile commands and can be replaced inline in many as well.
#
# The ENV instruction has two forms. The first form, ENV <key> <value>, will set a single variable to a value. The entire string after the first space will be treated as the <value> - including characters such as spaces and quotes.
#
# The second form, ENV <key>=<value> ..., allows for multiple variables to be set at one time. Notice that the second form uses the equals sign (=) in the syntax, while the first form does not. Like command line parsing, quotes and backslashes can be used to include spaces within values.
#
# For example:
#
# ENV myName="John Doe" myDog=Rex\ The\ Dog \
#     myCat=fluffy
# and
#
# ENV myName John Doe
# ENV myDog Rex The Dog
# ENV myCat fluffy
#
#ENV PG_MAJOR 9.3
#ENV PG_VERSION 9.3.4
#RUN curl -SL http://example.com/postgres-$PG_VERSION.tar.xz | tar -xJC /usr/src/postgress && …
#ENV PATH /usr/local/postgres-$PG_MAJOR/bin:$PATH
#
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# ADD
#
# ADD has two forms:
#
# ADD <src>... <dest>
# ADD ["<src>",... "<dest>"] (this form is required for paths containing whitespace)
# The ADD instruction copies new files, directories or remote file URLs from <src> and adds them to the filesystem of the container at the path <dest>.
#
# Multiple <src> resource may be specified but if they are files or directories then they must be relative to the source directory that is being built (the context of the build).
#
# Each <src> may contain wildcards and matching will be done using Go’s filepath.Match rules. For example:
#
# ADD hom* /mydir/        # adds all files starting with "hom"
# ADD hom?.txt /mydir/    # ? is replaced with any single character, e.g., "home.txt"
# The <dest> is an absolute path, or a path relative to WORKDIR, into which the source will be copied inside the destination container.
#
# ADD test relativeDir/          # adds "test" to `WORKDIR`/relativeDir/
# ADD test /absoluteDir/         # adds "test" to /absoluteDir/
#
#ADD ./bin /usr/local/sbin


# COPY
#
# COPY has two forms:
#
# COPY <src>... <dest>
# COPY ["<src>",... "<dest>"] (this form is required for paths containing whitespace)
# The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>.
#
# Multiple <src> resource may be specified but they must be relative to the source directory that is being built (the context of the build).
#
# Each <src> may contain wildcards and matching will be done using Go’s filepath.Match rules. For example:
#
# COPY hom* /mydir/        # adds all files starting with "hom"
# COPY hom?.txt /mydir/    # ? is replaced with any single character, e.g., "home.txt"
# The <dest> is an absolute path, or a path relative to WORKDIR, into which the source will be copied inside the destination container.
#
# COPY test relativeDir/   # adds "test" to `WORKDIR`/relativeDir/
# COPY test /absoluteDir/  # adds "test" to /absoluteDir/
#
#COPY vol-data /vol-data


# ENTRYPOINT
#
# ENTRYPOINT has two forms:
#
# ENTRYPOINT ["executable", "param1", "param2"] (exec form, preferred)
# ENTRYPOINT command param1 param2 (shell form)
# An ENTRYPOINT allows you to configure a container that will run as an executable.
#
# For example, the following will start nginx with its default content, listening on port 80:
#
# docker run -i -t --rm -p 80:80 nginx
# Command line arguments to docker run <image> will be appended after all elements in an exec form ENTRYPOINT, and will override all elements specified using CMD. This allows arguments to be passed to the entry point, i.e., docker run <image> -d will pass the -d argument to the entry point. You can override the ENTRYPOINT instruction using the docker run --entrypoint flag.
#
# The shell form prevents any CMD or run command line arguments from being used, but has the disadvantage that your ENTRYPOINT will be started as a subcommand of /bin/sh -c, which does not pass signals. This means that the executable will not be the container’s PID 1 - and will not receive Unix signals - so your executable will not receive a SIGTERM from docker stop <container>.
#
# Only the last ENTRYPOINT instruction in the Dockerfile will have an effect.
#
# Exec form ENTRYPOINT example
# You can use the exec form of ENTRYPOINT to set fairly stable default commands and arguments and then use either form of CMD to set additional defaults that are more likely to be changed.
#
# FROM ubuntu
# ENTRYPOINT ["top", "-b"]
# CMD ["-c"]
# When you run the container, you can see that top is the only process:
#
#ENTRYPOINT 


# VOLUME
#
# VOLUME ["/data"]
# The VOLUME instruction creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers. The value can be a JSON array, VOLUME ["/var/log/"], or a plain string with multiple arguments, such as VOLUME /var/log or VOLUME /var/log /var/db. For more information/examples and mounting instructions via the Docker client, refer to Share Directories via Volumes documentation.
#
# The docker run command initializes the newly created volume with any data that exists at the specified location within the base image. For example, consider the following Dockerfile snippet:
#
# FROM ubuntu
# RUN mkdir /myvol
# RUN echo "hello world" > /myvol/greeting
# VOLUME /myvol
# This Dockerfile results in an image that causes docker run, to create a new mount point at /myvol and copy the greeting file into the newly created volume.
#
# Note: If any build steps change the data within the volume after it has been declared, those changes will be discarded.
#
#VOLUME /vol-data
VOLUME /media-vol

# USER
#
# USER daemon
# The USER instruction sets the user name or UID to use when running the image and for any RUN, CMD and ENTRYPOINT instructions that follow it in the Dockerfile.
#
#USER


# WORKDIR
#
# WORKDIR /path/to/workdir
# The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction.
#
# It can be used multiple times in the one Dockerfile. If a relative path is provided, it will be relative to the path of the previous WORKDIR instruction. For example:
#
# WORKDIR /a
# WORKDIR b
# WORKDIR c
# RUN pwd
# The output of the final pwd command in this Dockerfile would be /a/b/c.
#
# The WORKDIR instruction can resolve environment variables previously set using ENV. You can only use environment variables explicitly set in the Dockerfile. For example:
#
# ENV DIRPATH /path
# WORKDIR $DIRPATH/$DIRNAME
# RUN pwd
# The output of the final pwd command in this Dockerfile would be /path/$DIRNAME
#
#WORKDIR 


# ARG
#
# ARG <name>[=<default value>]
# The ARG instruction defines a variable that users can pass at build-time to the builder with the docker build command using the --build-arg <varname>=<value> flag. If a user specifies a build argument that was not defined in the Dockerfile, the build outputs an error.
#
# One or more build-args were not consumed, failing build.
# The Dockerfile author can define a single variable by specifying ARG once or many variables by specifying ARG more than once. For example, a valid Dockerfile:
#
# FROM busybox
# ARG user1
# ARG buildno
# ...
# A Dockerfile author may optionally specify a default value for an ARG instruction:
#
# FROM busybox
# ARG user1=someuser
# ARG buildno=1
# ...
# If an ARG value has a default and if there is no value passed at build-time, the builder uses the default.
#
# An ARG variable definition comes into effect from the line on which it is defined in the Dockerfile not from the argument’s use on the command-line or elsewhere. For example, consider this Dockerfile:
#
# 1 FROM busybox
# 2 USER ${user:-some_user}
# 3 ARG user
# 4 USER $user
# ...
# A user builds this file by calling:
#
# $ docker build --build-arg user=what_user Dockerfile
# The USER at line 2 evaluates to some_user as the user variable is defined on the subsequent line 3. The USER at line 4 evaluates to what_user as user is defined and the what_user value was passed on the command line. Prior to its definition by an ARG instruction, any use of a variable results in an empty string.
#
# Warning: It is not recommended to use build-time variables for passing secrets like github keys, user credentials etc. Build-time variable values are visible to any user of the image with the docker history command.
# You can use an ARG or an ENV instruction to specify variables that are available to the RUN instruction. Environment variables defined using the ENV instruction always override an ARG instruction of the same name. Consider this Dockerfile with an ENV and ARG instruction.
#
# 1 FROM ubuntu
# 2 ARG CONT_IMG_VER
# 3 ENV CONT_IMG_VER v1.0.0
# 4 RUN echo $CONT_IMG_VER
# Then, assume this image is built with this command:
#
# $ docker build --build-arg CONT_IMG_VER=v2.0.1 Dockerfile
# In this case, the RUN instruction uses v1.0.0 instead of the ARG setting passed by the user:v2.0.1 This behavior is similar to a shell script where a locally scoped variable overrides the variables passed as arguments or inherited from environment, from its point of definition.
#
# Using the example above but a different ENV specification you can create more useful interactions between ARG and ENV instructions:
#
# 1 FROM ubuntu
# 2 ARG CONT_IMG_VER
# 3 ENV CONT_IMG_VER ${CONT_IMG_VER:-v1.0.0}
# 4 RUN echo $CONT_IMG_VER
# Unlike an ARG instruction, ENV values are always persisted in the built image. Consider a docker build without the –build-arg flag:
#
# $ docker build Dockerfile
# Using this Dockerfile example, CONT_IMG_VER is still persisted in the image but its value would be v1.0.0 as it is the default set in line 3 by the ENV instruction.
#
# The variable expansion technique in this example allows you to pass arguments from the command line and persist them in the final image by leveraging the ENV instruction. Variable expansion is only supported for a limited set of Dockerfile instructions.
#
# Docker has a set of predefined ARG variables that you can use without a corresponding ARG instruction in the Dockerfile.
#
# HTTP_PROXY
# http_proxy
# HTTPS_PROXY
# https_proxy
# FTP_PROXY
# ftp_proxy
# NO_PROXY
# no_proxy
# To use these, simply pass them on the command line using the flag:
#
# --build-arg <varname>=<value>
#
#ARG


# ONBUILD
#
# ONBUILD [INSTRUCTION]
# The ONBUILD instruction adds to the image a trigger instruction to be executed at a later time, when the image is used as the base for another build. The trigger will be executed in the context of the downstream build, as if it had been inserted immediately after the FROM instruction in the downstream Dockerfile.
#
# Any build instruction can be registered as a trigger.
#
# This is useful if you are building an image which will be used as a base to build other images, for example an application build environment or a daemon which may be customized with user-specific configuration.
#
# For example, if your image is a reusable Python application builder, it will require application source code to be added in a particular directory, and it might require a build script to be called after that. You can’t just call ADD and RUN now, because you don’t yet have access to the application source code, and it will be different for each application build. You could simply provide application developers with a boilerplate Dockerfile to copy-paste into their application, but that is inefficient, error-prone and difficult to update because it mixes with application-specific code.
#
# The solution is to use ONBUILD to register advance instructions to run later, during the next build stage.
#
# Here’s how it works:
#
# When it encounters an ONBUILD instruction, the builder adds a trigger to the metadata of the image being built. The instruction does not otherwise affect the current build.
# At the end of the build, a list of all triggers is stored in the image manifest, under the key OnBuild. They can be inspected with the docker inspect command.
# Later the image may be used as a base for a new build, using the FROM instruction. As part of processing the FROM instruction, the downstream builder looks for ONBUILD triggers, and executes them in the same order they were registered. If any of the triggers fail, the FROM instruction is aborted which in turn causes the build to fail. If all triggers succeed, the FROM instruction completes and the build continues as usual.
# Triggers are cleared from the final image after being executed. In other words they are not inherited by “grand-children” builds.
# For example you might add something like this:
#
# [...]
# ONBUILD ADD . /app/src
# ONBUILD RUN /usr/local/bin/python-build --dir /app/src
# [...]
# Warning: Chaining ONBUILD instructions using ONBUILD ONBUILD isn’t allowed.
# Warning: The ONBUILD instruction may not trigger FROM or MAINTAINER instructions.
#
#ONBUILD 


# STOPSIGNAL
#
# STOPSIGNAL signal
# The STOPSIGNAL instruction sets the system call signal that will be sent to the container to exit. This signal can be a valid unsigned number that matches a position in the kernel’s syscall table, for instance 9, or a signal name in the format SIGNAME, for instance SIGKILL.
#
#STOPSIGNAL 


# HEALTHCHECK
#
# The HEALTHCHECK instruction has two forms:
#
# HEALTHCHECK [OPTIONS] CMD command (check container health by running a command inside the container)
# HEALTHCHECK NONE (disable any healthcheck inherited from the base image)
# The HEALTHCHECK instruction tells Docker how to test a container to check that it is still working. This can detect cases such as a web server that is stuck in an infinite loop and unable to handle new connections, even though the server process is still running.
#
# When a container has a healthcheck specified, it has a health status in addition to its normal status. This status is initially starting. Whenever a health check passes, it becomes healthy (whatever state it was previously in). After a certain number of consecutive failures, it becomes unhealthy.
#
# The options that can appear before CMD are:
#
# --interval=DURATION (default: 30s)
# --timeout=DURATION (default: 30s)
# --retries=N (default: 3)
# The health check will first run interval seconds after the container is started, and then again interval seconds after each previous check completes.
#
# If a single run of the check takes longer than timeout seconds then the check is considered to have failed.
#
# It takes retries consecutive failures of the health check for the container to be considered unhealthy.
#
# There can only be one HEALTHCHECK instruction in a Dockerfile. If you list more than one then only the last HEALTHCHECK will take effect.
#
# The command after the CMD keyword can be either a shell command (e.g. HEALTHCHECK CMD /bin/check-running) or an exec array (as with other Dockerfile commands; see e.g. ENTRYPOINT for details).
#
# The command’s exit status indicates the health status of the container. The possible values are:
#
# 0: success - the container is healthy and ready for use
# 1: unhealthy - the container is not working correctly
# 2: reserved - do not use this exit code
# For example, to check every five minutes or so that a web-server is able to serve the site’s main page within three seconds:
#
# HEALTHCHECK --interval=5m --timeout=3s \
#   CMD curl -f http://localhost/ || exit 1
# To help debug failing probes, any output text (UTF-8 encoded) that the command writes on stdout or stderr will be stored in the health status and can be queried with docker inspect. Such output should be kept short (only the first 4096 bytes are stored currently).
#
# When the health status of a container changes, a health_status event is generated with the new status.
#
# The HEALTHCHECK feature was added in Docker 1.12.
#
#HEALTHCHECK


# SHELL
#
# SHELL ["executable", "parameters"]
# The SHELL instruction allows the default shell used for the shell form of commands to be overridden. The default shell on Linux is ["/bin/sh", "-c"], and on Windows is ["cmd", "/S", "/C"]. The SHELL instruction must be written in JSON form in a Dockerfile.
#
# The SHELL instruction is particularly useful on Windows where there are two commonly used and quite different native shells: cmd and powershell, as well as alternate shells available including sh.
#
# The SHELL instruction can appear multiple times. Each SHELL instruction overrides all previous SHELL instructions, and affects all subsequent instructions. For example:
#
# FROM windowsservercore
#
# Executed as cmd /S /C echo default
# RUN echo default
#
# Executed as cmd /S /C powershell -command Write-Host default
# RUN powershell -command Write-Host default
#
# Executed as powershell -command Write-Host hello
# SHELL ["powershell", "-command"]
# RUN Write-Host hello
#
# Executed as cmd /S /C echo hello
# SHELL ["cmd", "/S"", "/C"]
# RUN echo hello
#
#SHELL 


