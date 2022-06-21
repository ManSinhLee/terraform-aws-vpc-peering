resource "aws_security_group" "virginia_public_sg" {
  provider = aws.virginia
  name     = "virginia_public_sg"
  vpc_id   = aws_vpc.virginia_vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.my_address, var.office_address, "10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow SSH from my ip address"
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTP traffic from internet"
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow PING"
  }
  ingress {
    from_port        = 1024
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  egress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow PING"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow all traffic outbound"
  }
}

resource "aws_security_group" "virginia_private_sg" {
  provider = aws.virginia
  name     = "virginia_private_sg"
  vpc_id   = aws_vpc.virginia_vpc.id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow SSH from vpc"
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTP traffic from internet"
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow PING"
  }
  ingress {
    from_port        = 1024
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow all traffic outbound"
  }
}

resource "aws_security_group" "virginia_database_sg" {
  provider = aws.virginia
  name     = "virginia_database_sg"
  vpc_id   = aws_vpc.virginia_vpc.id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow SSH from vpc"
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTP traffic from internet"
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow PING"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16", "128.0.0.0/16"]
    description = "allow traffic inside vpc"
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    description = "allow traffic inside vpc"
  }
  ingress {
    from_port        = 1024
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
    description = "allow all traffic outbound"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow all traffic outbound"
  }
}

resource "aws_security_group" "oregon_public_sg" {
  provider = aws.oregon
  name     = "oregon_public_sg"
  vpc_id   = aws_vpc.oregon_vpc.id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.my_address, var.office_address, "10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow SSH from my ip address"
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTP traffic from internet"
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow PING"
  }
  ingress {
    from_port        = 1024
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  egress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow PING"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow all traffic outbound"
  }
}

resource "aws_security_group" "oregon_private_sg" {
  provider = aws.oregon
  name     = "oregon_private_sg"
  vpc_id   = aws_vpc.oregon_vpc.id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow SSH from vpc"
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTP traffic from internet"
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow PING"
  }
  ingress {
    from_port        = 1024
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow all traffic outbound"
  }
}

resource "aws_security_group" "oregon_database_sg" {
  provider = aws.oregon
  name     = "oregon_database_sg"
  vpc_id   = aws_vpc.oregon_vpc.id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow SSH from vpc"
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTP traffic from internet"
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["10.0.0.0/16", "128.0.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow PING"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16", "128.0.0.0/16"]
    description = "allow traffic inside vpc"
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    description = "allow traffic inside vpc"
  }
  ingress {
    from_port        = 1024
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow HTTPs traffic from internet"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
    description = "allow all traffic outbound"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "allow all traffic outbound"
  }
}