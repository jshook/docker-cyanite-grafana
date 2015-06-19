#!/bin/bash

pushd cassandra
echo "====================================="
echo "=        BUILDING CASSANDRA         ="
echo "====================================="
./build.sh
popd

# docker run -d --name="cass01" mbrannigan/cassandra:0.1.0

pushd cyanite
echo "====================================="
echo "=         BUILDING CYANITE          ="
echo "====================================="
./build.sh
popd

# docker run -d -p 2003:2003 --name="cyanite01" --link cass01:cass01 mbrannigan/cyanite:0.1.0 
pushd graphite_api
echo "====================================="
echo "=         BUILDING GRAPHITE         ="
echo "====================================="
./build.sh
# docker run -d -p 8000:8000 -p 80:80 --link cyanite01:cyanite01 --name "graphite01" mbrannigan/graphite_api:0.1.0 

echo "====================================="
echo "=              ALL DONE             ="
echo "====================================="
