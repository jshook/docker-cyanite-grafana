#!/bin/bash

for subsystem in cassandra cyanite graphite_api grafana
do
 if [ ! -d "$subsystem" ] ; then echo "$subsystem does not exist" ; exit 2 ; fi
 pushd $subsystem
 printf "running  %s\n" "$subsystem"
 ./run.sh
 printf "allowing 15 seconds for container to startup... \n" ; sleep 15
 popd
done
printf "done\n"
