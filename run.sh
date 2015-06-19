#!/bin/bash
sudo docker run -d --name="cass01" jshook/cassandra:0.1.0
sudo docker run -d -p 2003:2003 --name="cyanite01" --link cass01:cass01 jshook/cyanite:0.1.0 
sudo docker run -d -p 8000:8000 -p 80:80 --link cyanite01:cyanite01 --name "graphite01" jshook/graphite_api:0.1.0 
