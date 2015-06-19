#!/bin/bash
sudo docker run -d -p 9042:9042 -p 9160:9160 --name="cass01" jshook/cassandra:0.1.0
sudo docker run -d -p 2003:2003 --name="cyanite01" --link cass01:cass01 jshook/cyanite:0.1.0 
sudo docker run -d -p 8000:8000 --link cyanite01:cyanite01 --name "graphite01" jshook/graphite_api:0.1.0 
sudo docker run -d -p 80:80 --link graphite01:graphite01 --name "grafana01" jshook/grafana:0.1.0
