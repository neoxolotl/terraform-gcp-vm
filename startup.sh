#!/bin/bash 
#------------------Install Docker 
sudo -s 
yum update -y 
echo "-> ....update ... " > /dev/pts/0
yum install strace -y 
echo "-> ....strace ... " > /dev/pts/0
yum install yum-utils device-mapper-persistent-data lvm2
echo "-> ....lvm2 ... " > /dev/pts/0  
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
echo "-> ....config manager add repo  ... "> /dev/pts/0
yum install docker-ce -y 
echo "-> .... Install docker ce " > /dev/pts/0
##yum install docker.io -y 
echo "-> ....start docker ... " > /dev/pts/0
systemctl start docker 
echo "-> ....enable docker ... " > /dev/pts/0
systemctl enable docker
echo "-> ...status  docker --- " > /dev/pts/0
systemctl status docker
ps aux | grep bash > /dev/pts/0 

echo "-> ...End ??? --- " > /dev/pts/0

#------------------Install Docker 






#docker -v

#Executing the Docker Command Without Sudo
#sudo usermod -aG docker $USER
#sudo usermod -aG docker root
#logout
#login
#docker ps
