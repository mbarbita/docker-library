# This is a comment
FROM ubuntu-golang
MAINTAINER mbm <mbarbita@gmail.com>
RUN go get github.com/mbarbita/raspberry-relay-shield
WORKDIR $HOME/gows/src/github.com/mbarbita/raspberry-relay-shield
RUN go build -v
EXPOSE 8080
CMD $HOME/gows/src/github.com/mbarbita/raspberry-relay-shield/raspberry-relay-shield

