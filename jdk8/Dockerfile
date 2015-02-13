
# Oracle java SE8 jdk on centos withj ec2 tools
# 13/2/2015

FROM centos:latest
MAINTAINER Xavier Gandillot <xavier@gandillot.com>

RUN yum -y update 
RUN yum -y install  wget python unzip iptraf
RUN wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
RUN unzip awscli-bundle.zip && rm awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

RUN aws configure set region eu-west-1
RUN aws configure list

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.rpm
RUN yum -y install jdk-8u31-linux-x64.rpm 
RUN rm jdk-8u31-linux-x64.rpm 
RUN yum clean all

RUN useradd lambda
USER lambda
RUN ECHO "User name is : lambda"
RUN ["java","-version"]


