
#/bin/bash
yum install epel-release -y
yum install wget git -y
sudo wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install java-11-openjdk-devel -y
yum install jenkins -y
systemctl daemon-reload
sudo systemctl start jenkins
###instalacao do docker e docker compose
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli  containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
systemctl daemon-reload
systemctl restart docker
usermod -aG docker jenkins

#instalar sonar scanner
yum install wget unzip -y 
sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
sudo unzip sonar-scanner-cli-4.8.0.2856-linux.zip -d /opt/
sudo mkdir /opt/sonar-scanner
sudo mv /opt/sonar-scanner-4.8.0.2856-linux /opt/sonar-scanner
sudo chown -R jenkins:jenkins /opt/sonar-scanner/sonar-scanner-4.8.0.2856-linux
sudo echo 'export PATH=$PATH:/opt/sonar-scanner/sonar-scanner-4.8.0.2856-linux/bin' | sudo tee -a /etc/profile
sudo curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y
sudo systemctl start jenkins