# xavier268/selnode10:45

# Oracle java SE8 jdk and Selenium Server on centos
# 6/3/2015

FROM xavier268/jdk8:latest
MAINTAINER Xavier Gandillot <xavier@gandillot.com>

# Load Xvfb et firefox
USER root
RUN yum -y update && yum -y install -y xorg-x11-server-Xvfb libXfont firefox wget && yum clean all

# adjust java policy
ADD policy /policy
RUN cat /policy >> /usr/java/default/jre/lib/security/java.policy && rm /policy

# As lambda user
USER lambda
WORKDIR /home/lambda/

# download selenium-server-standalone
RUN wget http://selenium-release.storage.googleapis.com/2.45/selenium-server-standalone-2.45.0.jar

COPY run.sh /home/lambda/
COPY runDebug.sh /home/lambda/
COPY node.json /home/lambda/
COPY hub.json /home/lambda/

USER root
RUN chmod +x /home/lambda/run.sh
RUN chmod +x /home/lambda/runDebug.sh

# Needed for Xvfb
RUN mkdir -p /tmp/.X11-unix
RUN chmod 1777 /tmp/.X11-unix
RUN chown root /tmp/.X11-unix


USER lambda
EXPOSE 4444

CMD /home/lambda/run.sh && /bin/bash




