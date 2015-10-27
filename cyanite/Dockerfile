## begin common

FROM centos:centos6
MAINTAINER Jonathan Shook <jshook@gmail.com>

# JVM
WORKDIR /tmp
RUN yum install -y wget lsof nc
RUN wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm
RUN rpm -Uvh --quiet jdk-8u60-linux-x64.rpm

# EPEL
RUN rpm -Uvh --quiet --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum update -y --quiet
RUN yum install -y javassist python-pip python-devel
RUN pip install --upgrade pip

# Yeah, this is ugly. Dependency overkill. But the tools are useful.
RUN mv /var/log/yum.log /var/log/yum.log.previous
RUN yum groupinstall -y "Development Tools"
RUN pip install cyanite-utils
# This is a work-around, because groupremove is not complimentary to groupinstall
RUN grep 'Installed:' /var/log/yum.log | cut -d' ' -f5 | xargs yum remove -y
RUN mv /var/log/yum.log /var/log/yum.log.tmpdev
RUN mv /var/log/yum.log.previous /var/log/yum.log

# Cassandra Repo
COPY files/etc/yum.repos.d/datastax-community.repo /etc/yum.repos.d/datastax-community.repo
# Install cassandra
RUN yum install -y --quiet dsc21 cassandra21-tools

RUN yum clean all

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
