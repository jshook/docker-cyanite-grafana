#!/bin/bash

for subsystem in cassandra cyanite graphite_api grafana
do
 if [ ! -d "$subsystem" ] ; then echo "$subsystem does not exist" ; exit 2 ; fi
 pushd $subsystem
 printf "building %s\n" "$subsystem"
 ./build.sh
 popd
done
printf "done\n"

# docker run -d --name="cass01" mbrannigan/cassandra:0.1.0
# docker run -d -p 2003:2003 --name="cyanite01" --link cass01:cass01 mbrannigan/cyanite:0.1.0 
# docker run -d -p 8000:8000 -p 80:80 --link cyanite01:cyanite01 --name "graphite01" mbrannigan/graphite_api:0.1.0 
