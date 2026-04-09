resource "aws_vpc" "wordpress-tf-vpc" {
  cidr_block = "192.168.0.0/27" # hardcoded
  tags = {
    Name = "wordpress-tf-vpc"
  }
}
