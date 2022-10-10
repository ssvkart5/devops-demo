#!/bin/bash
# update packeges
sudo yum update -y
# install most latet dockert engine
sudo amazon-linux-extras install docker
# start docket service
sudo systemctl start docker
# enable docker service
sudo systemctl enable docker
# add ec2-user group
sudo usermod -a -G docker ec2-user