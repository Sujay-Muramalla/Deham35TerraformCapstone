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
