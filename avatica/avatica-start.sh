#!/bin/sh

# https://hub.docker.com/r/apache/calcite-avatica

docker run -d -p 8765:8765 --name some-avatica apache/calcite-avatica:1.15.0

