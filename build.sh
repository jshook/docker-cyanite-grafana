#!/bin/bash
echo "====================================="
echo "=        BUILDING CASSANDRA         ="
echo "====================================="

pushd .
cd cassandra
./build.sh
./run.sh
popd
 
echo "====================================="
echo "=         BUILDING CYANITE          ="
echo "====================================="
cd ../cyanite
docker build --tag="jshook/cyanite:0.1.0" .
sleep 3
docker run -d -p 2003:2003 --name="cyanite01" --link cass01:cass01 jshook/cyanite:0.1.0 
sleep 10
echo "====================================="
echo "=         BUILDING GRAPHITE         ="
echo "====================================="
cd ../graphite_api
docker build --tag="jshook/graphite_api:0.1.0" .
sleep 3
docker run -d -p 8000:8000 -p 80:80 --link cyanite01:cyanite01 --name "graphite01" jshook/graphite_api:0.1.0 
sleep 10
echo "====================================="
echo "=              ALL DONE             ="
echo "====================================="
