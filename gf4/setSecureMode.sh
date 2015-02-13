#!/usr/bin/expect

# Enables the secure admin mode
# inspired by tutum/glassfish
# 18/11/2014

set password [lindex $argv 0]
set GDIR "/home/lambda/glassfish4/glassfish/bin"

spawn $GDIR/asadmin --user admin enable-secure-admin
expect "password"
send "$password\n"
expect eof
exit

