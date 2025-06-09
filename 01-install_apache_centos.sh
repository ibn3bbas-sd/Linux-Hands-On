#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo yum update -y

# Install Apache
echo "Installing Apache Web Server..."
sudo yum install httpd -y

# Enable Apache to start on boot
echo "Enabling Apache to start on boot..."
sudo systemctl enable httpd

# Start Apache service
echo "Starting Apache Web Server..."
sudo systemctl start httpd

# Adjust firewall settings (if firewalld is enabled)
echo "Configuring firewall..."
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

# Verify installation
echo "Verifying Apache installation..."
httpd -v

echo "Apache Web Server installation completed successfully!"

# -----------
# How to use:
# -----------

# This script is designed to install Apache Web Server on an CentOS system.


# 1. Save the script as install_apache_centos.sh

# 2. Make it executable:
#    chmod +x install_apache_centos.sh

# 3. Run the script:
#    ./install_apache_centos.sh