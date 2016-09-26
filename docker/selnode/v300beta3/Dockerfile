# Standalone container for running a docker hub with headless firefoxes
# (c) Xavier Gandillot - September 2016

FROM centos:7
MAINTAINER Xavier Gandillot<xavier@gandillot.com>

# Load Xvfb et firefox
USER root
RUN yum -y update && \
yum -y install -y xorg-x11-server-Xvfb libXfont wget java-1.8.0-openjdk bzip2 tar gtk3 && \
yum -y clean all

# Needed for Xvfb
RUN mkdir -p /tmp/.X11-unix
RUN chmod 1777 /tmp/.X11-unix
RUN chown root /tmp/.X11-unix

# Copy utility files
COPY selenium-server-standalone-3.0.0-beta3.jar /selenium-server.jar
COPY run.sh /run.sh
COPY runDebug.sh /runDebug.sh
COPY node.json /node.json
COPY hub.json /hub.json
RUN chmod +x /run.sh && chmod +x /runDebug.sh

# Install Firefox 49

RUN wget https://ftp.mozilla.org/pub/firefox/releases/49.0/linux-x86_64/en-US/firefox-49.0.tar.bz2 &&\
tar xjf firefox-49.0.tar.bz2 && \
rm firefox-49.0.tar.bz2 && \
mv firefox /opt/firefox49 && \
ln -s /opt/firefox49/firefox /usr/bin/firefox

# Install GeckoDriver
COPY geckodriver-v0.10.0-linux64.tar.gz /geckodriver.tar.gz
RUN tar xaf geckodriver.tar.gz && \
rm geckodriver.tar.gz && \
chmod +x geckodriver && \
mv geckodriver /usr/bin/

# Adjust java policy
COPY policy  /policy
RUN cat /policy >> /usr/lib/jvm/jre-1.8.0/lib/security/java.policy && rm /policy


# Open ports
EXPOSE 4444

# Lauch nodes and saty in the foreground with bash
CMD /run.sh && /bin/bash


