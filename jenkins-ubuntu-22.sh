#!/bin/bash

# Update the system
echo "Updating the system..."
sudo apt update -y

# Install OpenJDK 17
echo "Installing OpenJDK 17..."
sudo apt install openjdk-17-jre -y

# Verify Java installation
echo "Verifying Java installation..."
java -version

# Download the Jenkins repository key
echo "Downloading Jenkins repository key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository to sources list
echo "Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list again after adding the Jenkins repository
echo "Updating package list..."
sudo apt update -y

# Install Jenkins
echo "Installing Jenkins..."
sudo apt-get install jenkins -y

# Start Jenkins service
echo "Starting Jenkins..."
sudo systemctl start jenkins

# Check Jenkins service status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins | grep "Active"

# Retrieve Jenkins default password
echo "Fetching the Jenkins default password..."
DEFAULT_PASSWORD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

echo "Jenkins installation is complete."
echo "You can access Jenkins at: http://your-server-ip:8080"
echo "The default Jenkins password is: $DEFAULT_PASSWORD"
