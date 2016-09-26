#!/bin/bash

# (c) Xavier Gandillot <xavier@gandillot.com>
# September 2016

export DISPLAY=:99

/usr/bin/Xvfb :99 -screen 0 1024x768x24 -ac &

echo "Warning : logging is disabled"

# start hub
java -Dwebdriver.gecko.driver=/usr/bin/geckodriver -jar selenium-server.jar -role hub -hubConfig /hub.json > /dev/null 2> /dev/null &

#start node
java -Dwebdriver.gecko.driver=/usr/bin/geckodriver -jar selenium-server.jar  -role node -nodeConfig /node.json > /dev/null 2> /dev/null &






