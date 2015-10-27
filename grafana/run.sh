#!/usr/bin/bash
sudo docker run -d -p 3000:3000 --link cyanite01 --link graphite01 --name "grafana01" jshook/grafana:0.1.0 
