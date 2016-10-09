#!/bin/bash

apt-get install -y tomcat8 tomcat8-admin tomcat8-user tomcat8-common

#  ==== /var/lib/tomcat8/conf/tomcat-users.xml ====
echo -e "---------------------------------------------"
echo -e "Please enable tomcat manager-gui manually\n"
echo "/var/lib/tomcat8/conf/tomcat-users.xml"
echo -e "---------------------------------------------\n"
echo '<role rolename="tomcat"/>'
echo '<role rolename="manager-gui"/>'
echo '<user username="tomcat" password="tomcat" roles="tomcat, manager-gui"/>'

service tomcat8 start
