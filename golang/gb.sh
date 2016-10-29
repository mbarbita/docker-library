#!/bin/bash
docker run --rm -v "$PWD":/usr/src/"$1" -w /usr/src/"$1" golang go build -v
