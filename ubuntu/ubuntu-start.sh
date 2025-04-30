#!/bin/bash

docker run -d \
--name some-ubuntu \
--log-opt max-size=10m \
--log-opt max-file=3 \
ubuntu
