#/usr/bin/bash
useradd sonar
yum install wget unzip java-11-openjdk-devel -y 
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.1.0.47736.zip
unzip sonarqube-9.1.0.47736.zip -d /opt/
mv /opt/sonarqube-9.1.0.47736 /opt/sonarqube
chown -R sonar:sonar /opt/sonarqube
touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
cat <<EOT >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT

sudo service sonar start
#instalar sonar scanner

sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
sudo unzip sonar-scanner-cli-4.8.0.2856-linux.zip -d /opt/
sudo mkdir /opt/sonar-scanner
sudo mv /opt/sonar-scanner-4.8.0.2856-linux /opt/sonar-scanner
sudo chown -R sonar:sonar /opt/sonar-scanner/sonar-scanner-4.8.0.2856-linux
sudo echo 'export PATH=$PATH:/opt/sonar-scanner/sonar-scanner-4.8.0.2856-linux/bin' | sudo tee -a /etc/profile
sudo curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y

#10e2c73bb10b3e781f3c9802a4a087622f11d519