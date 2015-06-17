FROM centos:centos6
MAINTAINER Jonathan Shook <mikejbrannigan@gmail.com>

# Update the stuff
RUN yum update -y --quiet 
# Install EPEL
RUN rpm -Uvh --quiet --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install Support Programs
RUN yum install -y --quiet wget git tar httpd mod_wsgi cairo python-pip gcc cairo-devel python-devel libffi-devel

# Install graphite-api and cyanite
RUN pip install --quiet graphite-api
RUN pip install --quiet cyanite

# Expose /var/log
VOLUME [ "/var/log" ]
VOLUME [ "/var/www/html" ]

# graphite-api config
COPY files/etc/graphite-api.yaml /etc/graphite-api.yaml

# Graphite http config
COPY files/etc/httpd/conf.d/graphite.conf /etc/httpd/conf.d/graphite.conf

# Graphite wsgi script
COPY files/var/www/wsgi-scripts/graphite-api.wsgi /var/www/wsgi-scripts/graphite-api.wsgi

# Create graphite directory
RUN mkdir -p /srv/graphite
RUN chown apache:apache /srv/graphite

# Expose ports
EXPOSE 8000 80

# Run apache
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]

