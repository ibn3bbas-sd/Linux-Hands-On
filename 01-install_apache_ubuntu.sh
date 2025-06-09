#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update -y

# Install Apache
echo "Installing Apache Web Server..."
sudo apt install apache2 -y

# Enable Apache to start on boot
echo "Enabling Apache to start on boot..."
sudo systemctl enable apache2

# Start Apache service
echo "Starting Apache Web Server..."
sudo systemctl start apache2

# Adjust firewall settings (if UFW is enabled)
echo "Checking firewall settings..."
sudo ufw allow 'Apache Full'

# Verify installation
echo "Verifying Apache installation..."
apache2 -v

echo "Apache Web Server installation completed successfully!"

# -----------
# How to use:
# -----------
# This script is designed to install Apache Web Server on an Ubuntu system.


# 1. Save the script as install_apache_ubuntu.sh

# 2. Make it executable:
#    chmod +x install_apache_ubuntu.sh

# 3. Run the script:
#    ./install_apache_ubuntu.sh