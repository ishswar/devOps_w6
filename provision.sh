#!/bin/bash

echo "##################################"
echo "######### Week 6 wrok ############"
echo "##################################"

printf "\n"

echo "-------- Free memory on VM ------------"

# Human readable format 

free -mt 

printf "\n"

echo "-------- Free Disk space -------------"

# Human readable format 

df -h 

printf "\n" 

echo "------- CPU info --------------"

# In non interactive shell mode start 'top' 

top -b -n 1


# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# sudo apt-get update
# apt-cache policy docker-ce
# sudo apt-get install -y docker-ce
# sudo systemctl status docker
# sudo usermod -aG docker ${USER}
docker run hello-world