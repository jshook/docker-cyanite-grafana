#!/bin/bash

for subsystem in cassandra cyanite graphite_api grafana
do
 if [ ! -d "$subsystem" ] ; then echo "$subsystem does not exist" ; exit 2 ; fi
 pushd $subsystem
 printf "building %s\n" "$subsystem"
 ./run.sh
 popd
 sleep 2
done
printf "done\n"
