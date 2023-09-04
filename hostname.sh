#!/bin/bash

# Prompt for the new hostname
read -p "Enter the new hostname: " new_hostname

# Check if the provided hostname is empty
if [ -z "$new_hostname" ]; then
    echo "Hostname cannot be empty. Exiting."
    exit 1
fi

# Set the new hostname in /etc/hostname
echo "$new_hostname" | sudo tee /etc/hostname > /dev/null

# Set the new hostname in /etc/hosts
sudo sed -i "s/127.0.0.1.*$/127.0.0.1\tlocalhost $new_hostname/" /etc/hosts

# Optionally, perform advanced editing (e.g., custom IP)
read -p "Do you want to perform advanced editing (e.g., custom IP)? (y/n): " advanced_edit

if [ "$advanced_edit" = "y" ] || [ "$advanced_edit" = "Y" ]; then
    # You can add your advanced editing options here
    # For example, you can prompt for a custom IP address and edit /etc/hosts accordingly.
    read -p "Enter a custom IP address for $new_hostname (leave empty for default 127.0.0.1): " custom_ip
    if [ -n "$custom_ip" ]; then
        # Replace the IP address in /etc/hosts
        sudo sed -i "s/127.0.0.1.*$/$custom_ip\tlocalhost $new_hostname/" /etc/hosts
    fi
fi

# Apply the new hostname
sudo hostnamectl set-hostname "$new_hostname"

# Restart the hostname service
sudo systemctl restart systemd-hostnamed

echo "Hostname changed to $new_hostname."

# Verify the changes
hostname
