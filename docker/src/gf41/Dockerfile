# xavier268/gf41
# Oracle java SE8 jdk and Glassfish4 on centos
# 26 sept 2014

FROM xavier268/jdk8:latest
MAINTAINER Xavier Gandillot <xavier@gandillot.com>

# As root
USER root
RUN yum -y update && yum -y install unzip expect && yum clean all

# adjust java policy
COPY policy /policy
RUN cat /policy >> /usr/java/default/jre/lib/security/java.policy
RUN rm /policy

# As lambda user
USER lambda
WORKDIR /home/lambda/

RUN wget dlc.sun.com.edgesuite.net/glassfish/4.1/release/glassfish-4.1.zip && \
unzip glassfish-4.1.zip && \
rm glassfish-4.1.zip

#prepare files

COPY setAdminPass.sh  /home/lambda/setAdminPass.sh
COPY setSecureMode.sh /home/lambda/setSecureMode.sh
COPY run.sh           /home/lambda/run.sh
USER root
RUN  chmod   +x       /home/lambda/*.sh
USER lambda



EXPOSE 4848 8080 8181

# Default starting command
CMD /home/lambda/run.sh && /bin/bash



