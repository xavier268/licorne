# xavier268/mongodb
# A MongoDB install on centos:latest

FROM centos:latest
MAINTAINER Xavier Gandillot <xavier@gandillot.com>

COPY mongo.repo /etc/yum.repos.d/mongo.repo

RUN yum -y update && yum -y install mongodb-org && yum clean all 

RUN useradd lambda
RUN mkdir -p /data/db && chown lambda:lambda /data/db/
VOLUME /data/db/

USER lambda
EXPOSE 27017

CMD /usr/bin/mongod 