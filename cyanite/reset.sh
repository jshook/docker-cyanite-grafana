#!/usr/bin/bash
sudo docker stop cyanite01
sudo docker rm cyanite01
sudo docker run -d -p 2003:2003 --name="cyanite01" --link cass01:cass01 jshook/cyanite:0.1.0 
