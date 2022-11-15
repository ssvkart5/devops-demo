# Configure the AWS provider

provider "aws" {
    region = "us-east-1"
}


# Create a VPC

resource "aws_vpc" "ekscluster-VPC"{
    cidr_block = var.cidr_block[0]

    tags = {
        Name = "ekscluster-VPC"
    }

}

# Create Subnet

resource "aws_subnet" "ekscluster-Subnet1" {
    vpc_id = aws_vpc.ekscluster-VPC.id
    cidr_block = var.cidr_block[1]

    tags = {
        Name = "ekscluster-Subnet1"
    }
}

resource "aws_subnet" "ekscluster-Subnet2" {
    vpc_id = aws_vpc.ekscluster-VPC.id
    cidr_block = var.cidr_block[1]

    tags = {
        Name = "ekscluster-Subnet2"
    }
}
# Create Internet Gateway

resource "aws_internet_gateway" "ekscluster-IntGW" {
    vpc_id = aws_vpc.ekscluster-VPC.id

    tags = {
        Name = "ekscluster-InternetGW"
    }
}


# Create Secutity Group

resource "aws_security_group" "ekscluster_Sec_Group" {
  name = "ekscluster Security Group"
  description = "To allow inbound and outbound traffic to ekscluster"
  vpc_id = aws_vpc.ekscluster-VPC.id

  dynamic ingress {
      iterator = port
      for_each = var.ports
       content {
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
       }

  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  } 

  tags = {
      Name = "allow traffic"
  }

}

# Create route table and association

resource "aws_route_table" "ekscluster_RouteTable" {
    vpc_id = aws_vpc.ekscluster-VPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ekscluster-IntGW.id
    }

    tags = {
        Name = "ekscluster_Routetable"
    }
}

# Create route table association
/*resource "aws_route_table_association" "ekscluster_Assn" {
    subnet_id = aws_subnet.ekscluster-Subnet1.id
    route_table_id = aws_route_table.ekscluster_RouteTable.id
}*/
resource "aws_route_table_association" "ekscluster_Assn" {
  count = "${length(var.subnet_cidrs_public)}"

  subnet_id      = "${element(aws_subnet.ekscluster_Assn.*.id, count.index)}"
  route_table_id = "${aws_route_table.ekscluster_Assn.id}"
}