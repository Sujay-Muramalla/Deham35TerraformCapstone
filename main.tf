terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }
}

resource "aws_vpc" "wordpress-tf-vpc" {
  cidr_block = "192.168.0.0/27"
  tags = {
    Name = "wordpress-tf-vpc"
  }
}
resource "aws_subnet" "public-tf-wordpress-subnet" {
  vpc_id     = aws_vpc.wordpress-tf-vpc.id
  cidr_block = "192.168.0.0/28"

  tags = {
    Name = "public-tf-wordpress-subnet"
  }
}

resource "aws_subnet" "private-tf-wordpress-subnet" {
  vpc_id     = aws_vpc.wordpress-tf-vpc.id
  cidr_block = "192.168.0.16/28"

  tags = {
    Name = "private-tf-wordpress-subnet"
  }
}

resource "aws_route_table" "public-tf-wordpress-rtb" {
  vpc_id = aws_vpc.wordpress-tf-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wordpress-tf-igw.id
  }

  tags = {
    Name = "public-tf-wordpress-rtb"
  }
}
resource "aws_route_table_association" "public-tf-wordpress-rtb-association" {
  subnet_id      = aws_subnet.public-tf-wordpress-subnet.id
  route_table_id = aws_route_table.public-tf-wordpress-rtb.id
}