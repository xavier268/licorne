#!/bin/bash

# (c) Xavier Gandillot <xavier@gandillot.com>
# September 2016

echo "Logging is enabled to stdout. Be careful, volumes can be very large, very fast !"

export DISPLAY=:99

/usr/bin/Xvfb :99 -screen 0 1024x768x24 -ac &

# start hub
java -Dwebdriver.gecko.driver=/usr/bin/geckodriver -jar selenium-server.jar -role hub -hubConfig /hub.json &

#start node
java -Dwebdriver.gecko.driver=/usr/bin/geckodriver -jar selenium-server.jar  -role node -nodeConfig /node.json &






