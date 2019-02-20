#!/bin/bash
sudo apt-get update
echo "Instaling default jdk"
sudo apt-get install default-jdk -y
sudo apt-get install git -y

echo "Create Tomcat User"
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
echo "Install Tomcat"
cd /tmp
sudo weget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz
#sudo curl -O http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.5/bin/apache-tomcat-8.5.5.tar.gz
sudo mkdir /opt/tomcat
sudo tar xzvf apache-tomcat-9*tar.gz -C /opt/tomcat --strip-components=1
echo "Update Permissions"
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/
echo "Create a systemd Service File"
# sudo update-java-alternatives -l # to get java path
sudo touch /etc/systemd/system/tomcat.service
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl status tomcat
echo "Adjust the Firewall and Test the Tomcat Server"
sudo ufw allow 8080
sudo systemctl enable tomcat
#deb http://security.ubuntu.com/ubuntu trusty-security main universe -y
#sudo apt-get install tomcat7
#sudo service tomcat7 restart

#sudo weget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz
#sudo ln -s /opt/tomcat/apache-tomcat-9.0.16 /opt/tomcat/latest
sudo sh -c 'chmod +x /opt/tomcat//bin/*.sh'

#https://linuxize.com/post/how-to-install-tomcat-9-on-ubuntu-18-04/
