#!/usr/bin/expect

# Set the admin password
# Inspired by tutum/glassfish
# 18/11/2014

set password [lindex $argv 0]
set GDIR "/home/lambda/glassfish4/glassfish/bin"

spawn $GDIR/asadmin --user admin change-admin-password
expect "password" 
send "\n" 
expect "password"
send "$password\n"
expect "password"
send "$password\n"
expect eof 
exit
