Cyanite / Graphite-API / Grafana
================================

This is a fork of github/mbrannigan/docker-cyanite-grafana. Thanks for the work!


Sets up various containers to provide a means of storing metrics via graphite into a cassandra instance via cyanite.

This uses cyanite, developed by Pierre-Yves Ritschard and graphite-cyanite/graphite-api developed by Bruno Renié

Description Of The Components
-----------------------------
- [grafana] - An open source, feature rich metrics dashboard and graph editor 
- [graphite-api] - Graphite-web, without the interface. Just the rendering HTTP API
- [graphite-cyanite] - A plugin for using graphite-web with the cassandra-based Cyanite storage backend
- [cyanite] - cassandra backed carbon daemon and metric web service
- [cassandra] - open source distributed database management system designed to handle large amounts of data across many commodity servers, providing high availability with no single point of failure. Used by cyanite to store the graphite data instead of the traditional graphite whisper files.


Building The Docker Containers
==============================
To build out the project, run the following

    ./build.sh

This merely executes the build.sh in each directory. These were created to capture the default docker configuration, as well as to make updating and testing Dockerfiles easier going forward. Sudo is called by default for each command. 

If you need to troubleshoot or manage one of the individual containers, simply go into that directory to look at build.sh and run.sh.
   


Usage
=====

1.  Access grafana at http://localhost:3000
2.  Login with the default grafana admin/admin credentials.
3.  Change the admin password.
4.  Add a data source: Type: graphite, URL: http://graphite01:8000, and make it the default

If you want to test it out,

1.  Write metrics via graphite at localhost:2003
    - Run ./test.sh to generate some test metrics - 1, 5 and 15 minute load averages
2.  Create a dashboard, a graph, and select the stats data source.
    
Vagrant Support
===============
Alternatively, there is a Vagrantfile in the directory to build out the servers via vagrant. This is untested since the significant changes after the fork.

[cyanite]: https://github.com/pyr/cyanite
[graphite-cyanite]: https://github.com/brutasse/graphite-cyanite
[graphite-api]: https://github.com/brutasse/graphite-api
[grafana]: http://grafana.org/
[cassandra]: http://cassandra.apache.org/
