#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
pwd

echo "build base docker image"
docker build --rm --force-rm -t 1000kit/base:latest .


#end
