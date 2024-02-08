#!/bin/bash
sudo yum update && sudo yum upgrade
sudo yum install nginx -y
sudo yum install java-17-amazon-corretto-devel -y
cd /opt
#installing mongo

echo "[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc" | sudo tee /etc/yum.repos.d/mongodb-org-7.0.repo

sudo dnf install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
# mongosh
cd /home/ec2-user
wget https://downloads.mongodb.com/compass/mongosh-2.1.3-linux-x64-openssl3.tgz
tar -xvf mongosh-2.1.3-linux-x64-openssl3.tgz
sudo mv mongosh-2.1.3-linux-x64-openssl3/bin/mongosh /usr/local/bin/
sudo mv mongosh-2.1.3-linux-x64-openssl3/bin/mongosh_crypt_v1.so /usr/local/bin/
cd /home/ec2-user/mongosh-2.1.3-linux-x64-openssl3
sudo ln -s $(pwd)/bin/* /usr/local/bin/
rm -rf mongosh-2.1.3-linux-x64-openssl3*