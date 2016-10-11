###########################
# restheart image with mongo included
# Oct 11, 2016
# Adapted from the "retheart" image from SoftInstigate <info@softinstigate.com>
###########################
FROM xavier268/mongodb
ENV release 2.0.2

#### Install java
RUN yum -y update && \
yum install -y java-1.8.0-openjdk curl httpie tar && \
yum clean all

#### Load restheart
RUN curl -sL https://github.com/SoftInstigate/restheart/releases/download/${release}/restheart-${release}.tar.gz --output restheart.tar.gz \
&& tar -zxvf restheart.tar.gz \
&& mv restheart-${release} restheart \
&& rm -f restheart.tar.gz

WORKDIR /
EXPOSE 4443

#### Copy configuration files from the /etc folder
COPY etc/* /restheart/etc/
