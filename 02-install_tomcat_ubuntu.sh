#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update -y

# Install Java (required for Tomcat)
echo "Installing Java..."
sudo apt install openjdk-11-jdk -y

# Create Tomcat user
echo "Creating Tomcat user..."
sudo groupadd tomcat
sudo useradd -M -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Download and install Tomcat
echo "Downloading Apache Tomcat..."
cd /tmp
wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.19/bin/apache-tomcat-10.1.19.tar.gz

echo "Extracting Tomcat..."
sudo mkdir -p /opt/tomcat
sudo tar -xvf apache-tomcat-10.1.19.tar.gz -C /opt/tomcat --strip-components=1

# Set permissions
echo "Setting permissions..."
sudo chown -R tomcat:tomcat /opt/tomcat
sudo chmod +x /opt/tomcat/bin/*.sh

# Create systemd service file
echo "Creating systemd service..."
sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and start Tomcat
echo "Starting Tomcat..."
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat

echo "Apache Tomcat installation completed successfully!"

# -----------
# How to use:
# -----------

# This script is designed to install Apache Web Server on an CentOS system.

# 1. Save the script as install_tomcat_ubuntu.sh

# 2. Make it executable:
#    chmod +x install_tomcat_ubuntu.sh

# 3. Run the script:
#    ./install_tomcat_ubuntu.sh