## begin common

FROM centos:centos6
MAINTAINER Jonathan Shook <jshook@gmail.com>

# EPEL
RUN rpm -Uvh --quiet --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y wget
RUN yum update -y --quiet

# JVM
WORKDIR /tmp
RUN wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
RUN rpm -Uvh --quiet jdk-8u45-linux-x64.rpm

# Cassandra Repo
COPY files/etc/yum.repos.d/datastax-community.repo /etc/yum.repos.d/datastax-community.repo

# Install cassandra
RUN yum install -y --quiet dsc21 cassandra21-tools
#RUN yum install -y --quiet dsc20 cassandra=2.0.11

## end common

# Copy /opt/cyanite
COPY files/opt/cyanite/ /opt/cyanite/

# Copy /etc/cyanite.yaml
COPY files/etc/cyanite.yaml /etc/cyanite.yaml

# Expose /var/log
VOLUME ["/var/log"]

# Ports 2003 and 8080
EXPOSE 2003 8080

# Run
CMD [ "/opt/cyanite/cyanite.sh" ]
