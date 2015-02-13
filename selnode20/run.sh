#!/bin/bash

export DISPLAY=:99

/usr/bin/Xvfb :99 -screen 0 1024x768x24 -ac &

# start hub
java -jar selenium-server-standalone-2.44.0.jar -role hub -hubConfig hub.json &

#start node
java -jar selenium-server-standalone-2.44.0.jar  -role node -nodeConfig node.json &






