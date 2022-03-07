#!/bin/bash

docker run -d \
--name some-postgres \
-e POSTGRES_PASSWORD=ginger \
-p 5432:5432 \
postgres

