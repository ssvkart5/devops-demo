terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# create VPC
resource "aws_vpc" "devops-vpc" {
    cidr_block = "192.168.0.0/16"

    tags = {
        name = "devops-vpc"
    }
}

# create subnet
resource "aws_subnet" "devops-public-subnet-1" {
    vpc_id = aws_vpc.devops-vpc.id 
    cidr_block = "192.168.10.0/24"

    tags = {
        name = "devops-public-subnet-1"
    }
}

resource "aws_subnet" "devops-public-subnet-2" {
    vpc_id = aws_vpc.devops-vpc.id 
    cidr_block = "192.168.20.0/24"

    tags = {
        name = "devops-public-subnet-2"
    }
}

# create internet gateway
resource "aws_internet_gateway" "devops-igw" {
    vpc_id = aws_vpc.devops-vpc.id 

    tags = {
        name = "devops-igw" 
    }
}

# create security group
resource "aws_security_group" "devops-sg" {
    name = "devops-sg"
    description = "to allow inbound and outbound traffic for my devops app"
    vpc_id = aws_vpc.devops-vpc.id 

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
        name = "allow traffic"
    }
}