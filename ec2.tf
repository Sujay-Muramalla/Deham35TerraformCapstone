resource "aws_instance" "wordpress-tf-instance" {
  ami                         = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type               = "t3.small"
  associate_public_ip_address = true
  key_name                    = "vockey"
  subnet_id                   = aws_subnet.public-tf-wordpress-subnet.id
  vpc_security_group_ids      = [aws_security_group.wordpress-tf-sg.id]

  tags = {
    Name = "wordpress-tf-instance"
  }
}
