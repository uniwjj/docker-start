#!/bin/sh

docker run -d \
-p 8983:8983 \
--name some-solr solr:5.5.2

