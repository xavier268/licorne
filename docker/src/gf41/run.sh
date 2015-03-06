#!/bin/bash

# Inspired by tutum/glassfish
# 18 nov 2014

set -e

GDIR="/home/lambda/glassfish4/glassfish/bin"

if [ ! -f .glassfish_admin_password_changed ]; then

	echo "Generating password ..."
	#generate pasword
	PASS=$(date | md5sum | head -c 8)

	echo "=> Setting a random password for admin in Glassfish"
	$GDIR/asadmin start-domain && /home/lambda/setAdminPass.sh $PASS && $GDIR/asadmin stop-domain

	echo "=> Enabling secure admin login"
	$GDIR/asadmin start-domain && /home/lambda/setSecureMode.sh $PASS && $GDIR/asadmin stop-domain

	echo "========================================================================"
	echo "You can now connect to this Glassfish server using:"
	echo ""
	echo " admin:$PASS"
	echo ""
	echo "Please remember to change the above password as soon as possible!"
	echo "========================================================================"

	touch .glassfish_admin_password_changed
fi
java -version
$GDIR/asadmin start-domain
$GDIR/asadmin start-database

echo "Host Name = $HOSTNAME"





