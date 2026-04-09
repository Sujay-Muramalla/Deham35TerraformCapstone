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
resource "aws_route_table" "private-tf-wordpress-rtb" {
  vpc_id = aws_vpc.wordpress-tf-vpc.id

  tags = {
    Name = "private-tf-wordpress-rtb"
  }
}

resource "aws_route_table_association" "private-tf-wordpress-rtb-association" {
  subnet_id      = aws_subnet.private-tf-wordpress-subnet.id
  route_table_id = aws_route_table.private-tf-wordpress-rtb.id
}