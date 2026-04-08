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
