#!/bin/bash
sudo apt-get update
echo "Instaling default jdk"
sudo apt-get install default-jdk -y
cd /tmp
git clone https://github.com/balavenkateshs/DevOps.git
cd DevOps/
echo "Copy tomcat service into system folder"
sudo touch /etc/systemd/system/tomcat.service
sudo cp tomcat.service /etc/systemd/system/tomcat.service
echo "Create Tomcat User"
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
echo "Install Tomcat"
sudo wget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz
sudo mkdir /opt/tomcat
sudo tar xzvf apache-tomcat-9*tar.gz -C /opt/tomcat --strip-components=1
echo "Update Permissions"
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/
echo "Create a systemd Service File"
sudo systemctl daemon-reload
echo "Enable executable mode"
sudo sh -c 'chmod +x /opt/tomcat//bin/*.sh'
sudo systemctl start tomcat
echo "Adjust the Firewall and Test the Tomcat Server"
sudo ufw allow 8080
sudo systemctl start tomcat
echo "enable boot time "
sudo systemctl enable tomcat
#deb http://security.ubuntu.com/ubuntu trusty-security main universe -y
#sudo apt-get install tomcat7
#sudo service tomcat7 restart

#sudo weget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz
#sudo ln -s /opt/tomcat/apache-tomcat-9.0.16 /opt/tomcat/latest


#https://linuxize.com/post/how-to-install-tomcat-9-on-ubuntu-18-04/
