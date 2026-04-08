# Setup Guide for Capstone Project

## Step 1

- Create a VPC
- Custom CIDR of 192.168.0.0/27 -> Total of 32 IPs, 27 usable due to 5 Reserved IPs on AWS

- Create 2 Subnets
- one public -> 192.168.0.0/28
- one private -> 192.168.0.16/28

- Creating two Custom Route Tables
- Associate the public route table with the public subnet and the private route table with the private subnet
- Create an Internet Gateway and attach it to the VPC

- Routing the Public RTB to the Internet Gateway
- Optionally: Route the Private RTB to a NAT Gateway (if you want to allow outbound internet access for private instances)

# Step 2

- Creating a Security Group with rules for SSH and HTTP access
- Creating a Security Group with rules for MySQL access

# Step 3

- Create an EC2 instance in the public subnet using the Amazon Linux 2023 AMI for Wordpress
- Optional: Create an EC2 instance in the Public subnet using the Amazon Linux 2023 AMI for MySQL

# Step 4

- Configure the Wordpress Instance
- Download WP
- Configure the mariadb client

```mysql
CREATE USER 'wpuser'@'locahost' IDENTIFIED BY 'test123!';
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wpuser'@'locahost';
FLUSH PRIVILEGES;
EXIT;
```
