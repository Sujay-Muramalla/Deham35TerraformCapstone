data "aws_ssm_parameter" "amazon_linux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "wordpress-tf-instance" {
  ami                         = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type               = "t3.small" # hardcoded | variables
  associate_public_ip_address = true
  key_name                    = "YAIC-KeyPair"
  subnet_id                   = aws_subnet.public-tf-wordpress-subnet.id
  vpc_security_group_ids      = [aws_security_group.wordpress-tf-sg.id]
  user_data                   = file("scripts/userdata.sh")

  tags = {
    Name = "wordpress-tf-instance"
  }
}

resource "aws_instance" "bastion-tf-instance" {
  ami                         = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type               = "t3.small" # hardcoded | variables
  associate_public_ip_address = true
  key_name                    = "YAIC-KeyPair"
  subnet_id                   = aws_subnet.public-tf-wordpress-subnet.id
  vpc_security_group_ids      = [aws_security_group.wordpress-tf-sg.id]
  user_data                   = file("scripts/userdata.sh")

  tags = {
    Name = "bastion-tf-instance"
  }
}
