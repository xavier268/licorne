#!/bin/bash

export DISPLAY=:99

/usr/bin/Xvfb :99 -screen 0 1024x768x24 -ac &

echo "Warning : logging is disabled"

# start hub
java -jar selenium-server-standalone-2.45.0.jar -role hub -hubConfig hub.json > /dev/null 2> /dev/null &

#start node
java -jar selenium-server-standalone-2.45.0.jar  -role node -nodeConfig node.json > /dev/null 2> /dev/null &






