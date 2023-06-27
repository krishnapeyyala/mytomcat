#!/bin/bash
# tomcat
#To Provision Tomcat server
sudo apt-get update -y
sudo apt-get install openjdk-11-jre-headless -y
sudo apt-get install zip -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76.tar.gz
sudo tar -xvzf apache-tomcat-9.0.76.tar.gz -C /opt
sudo mv apache-tomcat-9.0.76/ apache-tomcat9
sudo useradd -M -d /opt/apache-tomcat9/ tomcat
sudo chown -R tomcat. /opt/apache-tomcat9/
sudo sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /opt/tomcat9/webapps/manager/META-INF/context.xml
sudo sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /opt/tomcat9/webapps/host-manager/META-INF/context.xml
sed -i '/<\/tomcat-users>/i \
<role rolename="manager-gui"/>\
<role rolename="admin-gui"/>\
<user username="manager" password="12345" roles="manager-gui"/>\
<user username="admin" password="12345" roles="admin-gui"/>' /opt/tomcat9/conf/tomcat-users.xml
