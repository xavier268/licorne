# xavier268/db-data
# Data volume to manage derby databases folder
# 21 fev 2015

# Create container with : docker run -it --name datacontainerName xavier268/db-data
# Use container by : docker run --volumes-from datacontainerName ...
# Use the data, for instance, by starting a centos image with /bin/bash (as root)
# Export, if you really want to, to the host with docker cp datacontainerName:/home/lambda/glassfish4/glassfish/databases/ /host/dest
# DO NOT USE docker export, after committing the data-container - il will not contain the data from the volume !!

FROM xavier268/gf41:latest

MAINTAINER Xavier Gandillot <xavier@gandillot.com>

RUN mkdir -p /home/lambda/glassfish4/glassfish/databases/ && chown -R lambda:lambda /home/lambda/glassfish4/glassfish/databases/

VOLUME /home/lambda/glassfish4/glassfish/databases/

USER lambda

# default cmd will immediately exit - the container does not need to be running to be used as a data-container
CMD echo "Created data-container : /home/lambda/glassfish4/glassfish/databases/"

