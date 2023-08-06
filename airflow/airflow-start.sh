#!/bin/bash

# docker network create common-network

docker run -d \
--name some-airflow \
--net common-network \
-p 8080:8080 \
puckel/docker-airflow webserver

