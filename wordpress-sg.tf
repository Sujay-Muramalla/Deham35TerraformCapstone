resource "aws_security_group" "wordpress-tf-sg" {
  name        = "wordpress-tf-sg"
  description = "Allow for HTTP and SSH access to the WordPress instance"
  vpc_id      = aws_vpc.wordpress-tf-vpc.id

  tags = {
    Name = "wordpress-tf-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "wordpress-tf-sg-allow-http" {
  security_group_id = aws_security_group.wordpress-tf-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "wordpress-tf-sg-allow-ssh" {
  security_group_id = aws_security_group.wordpress-tf-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "wordpress-tf-sg-allow-mysql" {
  security_group_id = aws_security_group.wordpress-tf-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}

resource "aws_vpc_security_group_egress_rule" "wordpress-tf-sg-allow-all" {
  security_group_id = aws_security_group.wordpress-tf-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}