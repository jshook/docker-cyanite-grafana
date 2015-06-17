#!/usr/bin/bash

sudo docker run -d -p 9042:9042 -p 9160:9160 --name="cass01" jshook/cassandra-dsc:2.1.0

