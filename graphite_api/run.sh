#!/usr/bin/bash
sudo docker run -d -p 8000:8000 -p 80:80 --link cyanite01:cyanite01 --name "graphite01" jshook/graphite_api:0.1.0 
