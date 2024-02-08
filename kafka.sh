#!/bin/bash
sudo yum update && sudo yum upgrade

sudo yum install java-1.8.0-amazon-corretto-devel -y
sudo wget https://downloads.apache.org/kafka/3.6.1/kafka_2.13-3.6.1.tgz
sudo tar -xzf kafka_2.13-3.6.1.tgz
sudo mv kafka_2.13-3.6.1 /opt/kafka_2.13-3.6.1
cd /opt/kafka_2.13-3.6.1


echo "[Unit]
Requires=network.target remote-fs.target
After=network.target remote-fs.target

[Service]
Type=simple
ExecStart=/opt/kafka_2.13-3.6.1/bin/zookeeper-server-start.sh /opt/kafka_2.13-3.6.1/config/zookeeper.properties
ExecStop=/opt/kafka_2.13-3.6.1/bin/zookeeper-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/zookeeper.service

# Create a systemd service file for Kafka
echo "[Unit]
Requires=zookeeper.service
After=zookeeper.service

[Service]
Type=simple
ExecStart=/bin/sh -c '/opt/kafka_2.13-3.6.1/bin/kafka-server-start.sh /opt/kafka_2.13-3.6.1/config/server.properties > /opt/kafka_2.13-3.6.1/kafka.log 2>&1'
ExecStop=/opt/kafka_2.13-3.6.1/bin/kafka-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/kafka.service

sudo systemctl daemon-reload
sudo systemctl start zookeeper
sudo systemctl start kafka

sudo systemctl enable zookeeper
sudo systemctl enable kafka