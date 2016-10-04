#!/bin/bash

echo "This script demos how to set a replica set (3 servers) in 3 separate docker containers"
echo "mongo does not need to be installed on the host, nor running"
echo "WARNING : It will completely reset docker containers, network, volumes"
echo "Only enter root password below if you know what you are doing !"

# Entering root is a good sanity check ...
service docker start

echo "Clean up containers, volumes and networks"
docker kill $(docker ps -aq)
docker rm $(docker ps -aq)
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q)

echo "create private bridge"
docker network create -d bridge --subnet 172.25.0.0/16  mymongobridge
docker network ls

echo " launch 3 instances of mongodb, on the mymongobridge network"
echo "note : the 300x port mapping allow optional, alternatives access directly from the hosts"
docker run -d --name m1 -p 3001:27017 --net=mymongobridge xavier268/mongodb mongod --replSet mymongoset
docker run -d --name m2 -p 3002:27017 --net=mymongobridge xavier268/mongodb mongod --replSet mymongoset
docker run -d --name m3 -p 3003:27017 --net=mymongobridge xavier268/mongodb mongod --replSet mymongoset

docker ps -a
sleep 1

echo "See : http://www.sohamkamani.com/blog/2016/06/30/docker-mongo-replica-set/ for details"

echo "connecting and initiating the replica set"
echo "we do it from another container on the same network, to benefit from the DNS services - if calling from the host, m1,m2 and m3 are unknown."
docker run -it --rm --net mymongobridge xavier268/mongodb mongo --host m1 --eval 'c={"_id":"mymongoset","members":[{"_id":1,"host":"m1:27017"}, {"_id":2,"host":"m2:27017"}, {"_id":3,"host":"m3:27017"}]};rs.initiate(c);'

sleep 3
echo "connecting to the replica set"
echo "we do it from another container on the same network, to benefit from the DNS services - if calling from the host, m1,m2 and m3 are unknown."
docker run -it --rm --net mymongobridge xavier268/mongodb mongo --host "mymongoset/m1,m2,m3"





