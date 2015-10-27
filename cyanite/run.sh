#!/usr/bin/bash
sudo docker run -i -p 2003:2003 --name="cyanite01" --link cass01:cass01 'jshook/cyanite:0.1.0' $*
