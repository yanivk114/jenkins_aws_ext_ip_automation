#!/bin/bash

# Fetch external IP using Python script
EXTERNAL_IP=$(python3 /root/fetch_external_ip.py)

# Define Jenkins URL using the fetched external IP
JENKINS_URL="http://${EXTERNAL_IP}:8080"

# Update Jenkins URL in Jenkins configuration
sudo sed -i "s|<jenkinsUrl>.*</jenkinsUrl>|<jenkinsUrl>http://${JENKINS_URL}:8080</jenkinsUrl>|g" /var/lib/jenkins/jenkins.model.JenkinsLocationConfiguration.xml

# Restart Jenkins service to apply changes
sudo systemctl restart jenkins