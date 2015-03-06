# Oracle java SE8 jdk and Selenium Server on centos
# 6/3/2015

FROM xavier268/selnode:v45b10
MAINTAINER Xavier Gandillot <xavier@gandillot.com>

# As lambda user
USER lambda
WORKDIR /home/lambda/

COPY node.json /home/lambda/
COPY hub.json /home/lambda/

EXPOSE 4444

CMD /home/lambda/run.sh && /bin/bash




