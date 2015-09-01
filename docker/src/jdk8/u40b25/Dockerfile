
# xavier268/jdk8:u40b25
# Oracle java SE8 jdk on centos withj ec2 tools
# 6/3/2015

FROM centos:latest
MAINTAINER Xavier Gandillot <xavier@gandillot.com>

RUN yum -y update && yum -y install  wget python unzip && yum clean all
RUN wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip && \
unzip awscli-bundle.zip && rm awscli-bundle.zip

RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

RUN aws configure set region eu-west-1
RUN aws configure list

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jdk-8u40-linux-x64.rpm && \
yum -y install jdk-8u40-linux-x64.rpm && \
rm jdk-8u40-linux-x64.rpm &&  yum clean all


RUN useradd lambda
USER lambda

RUN ["java","-version"]
CMD /bin/bash


