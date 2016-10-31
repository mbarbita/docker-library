# This is a comment
FROM ubuntu:15.10
RUN apt-get update && apt-get -y upgrade && apt-get -y install wget git python-smbus
RUN wget -O - -nv https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz | tar zxf - -C /usr/local 
RUN mkdir $HOME/gows
ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=$HOME/gows
