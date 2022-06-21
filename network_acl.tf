resource "aws_network_acl" "virginia_public_nacl" {
  vpc_id     = aws_vpc.virginia_vpc.id
  subnet_ids = aws_subnet.virginia_public_subnet.*.id

  # allow inbound ssh connections
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.my_address
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 101
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.office_address
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 102
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "10.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 103
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "128.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  # allow inbound http,https connections
  ingress {
    rule_no    = 110
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    rule_no    = 111
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # allow inbound icmp connections
  ingress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  ingress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # allow outbound icmp connections
  egress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # allow outbound connection
  # egress {
  #   rule_no    = 300
  #   protocol   = "udp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  # egress {
  #   rule_no    = 301
  #   protocol   = "tcp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  egress {
    protocol   = -1
    rule_no    = 1000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    "Name" = "virginia_public_nacl"
  }
}

resource "aws_network_acl" "virginia_private_nacl" {
  vpc_id     = aws_vpc.virginia_vpc.id
  subnet_ids = aws_subnet.virginia_private_subnet.*.id

  # allow inbound ssh connections
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "10.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 101
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "128.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  # allow inbound http,https connections
  ingress {
    rule_no    = 110
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    rule_no    = 111
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # allow inbound icmp connections
  ingress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  ingress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # allow ephemeral ports
  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }


  # allow outbound connection
  egress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # egress {
  #   rule_no    = 300
  #   protocol   = "udp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  # egress {
  #   rule_no    = 301
  #   protocol   = "tcp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  egress {
    protocol   = -1
    rule_no    = 1000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    "Name" = "virginia_private_nacl"
  }
}

resource "aws_network_acl" "virginia_database_nacl" {
  vpc_id     = aws_vpc.virginia_vpc.id
  subnet_ids = aws_subnet.virginia_database_subnet.*.id

  # allow inbound ssh connections
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "10.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 101
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "128.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  # allow inbound http,https connections
  ingress {
    rule_no    = 110
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    rule_no    = 111
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # allow inbound icmp connections
  ingress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  ingress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # allow inbound for mysql and postgresql  
  ingress {
    rule_no    = 200
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "10.0.0.0/16"
    from_port  = 3306
    to_port    = 3306
  }
  ingress {
    rule_no    = 201
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "10.0.0.0/16"
    from_port  = 5432
    to_port    = 5432
  }

  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # allow outbound icmp connections
  egress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # allow outbound connection
  egress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # egress {
  #   rule_no    = 300
  #   protocol   = "udp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  # egress {
  #   rule_no    = 301
  #   protocol   = "tcp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  egress {
    protocol   = -1
    rule_no    = 1000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    "Name" = "virginia_database_nacl"
  }
}


resource "aws_network_acl" "oregon_public_nacl" {
  provider   = aws.oregon
  vpc_id     = aws_vpc.oregon_vpc.id
  subnet_ids = aws_subnet.oregon_public_subnet.*.id
  # allow inbound ssh connections
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.my_address
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 101
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.office_address
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 102
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "10.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 103
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "128.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  # allow inbound http,https connections
  ingress {
    rule_no    = 110
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    rule_no    = 111
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # allow inbound icmp connections
  ingress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  ingress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # allow outbound icmp connections
  egress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # allow outbound connection
  egress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # egress {
  #   rule_no    = 300
  #   protocol   = "udp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  # egress {
  #   rule_no    = 301
  #   protocol   = "tcp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  egress {
    protocol   = -1
    rule_no    = 1000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    "Name" = "oregon_public_nacl"
  }
}

resource "aws_network_acl" "oregon_private_nacl" {
  provider   = aws.oregon
  vpc_id     = aws_vpc.oregon_vpc.id
  subnet_ids = aws_subnet.oregon_private_subnet.*.id
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "10.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 101
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "128.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 110
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    rule_no    = 111
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # allow inbound icmp connections
  ingress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  ingress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # allow outbound connection
  egress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # egress {
  #   rule_no    = 300
  #   protocol   = "udp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  # egress {
  #   rule_no    = 301
  #   protocol   = "tcp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  egress {
    protocol   = -1
    rule_no    = 1000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    "Name" = "oregon_private_nacl"
  }
}

resource "aws_network_acl" "oregon_database_nacl" {
  provider   = aws.oregon
  vpc_id     = aws_vpc.oregon_vpc.id
  subnet_ids = aws_subnet.oregon_database_subnet.*.id
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "128.0.0.0/16"
    from_port  = 3306
    to_port    = 3306
  }
  ingress {
    rule_no    = 110
    action     = "allow"
    protocol   = "tcp"
    cidr_block = "128.0.0.0/16"
    from_port  = 5432
    to_port    = 5432
  }

  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
  egress {
    rule_no    = 130
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 140
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # allow outbound connection
  egress {
    rule_no    = 120
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }
  egress {
    rule_no    = 121
    action     = "allow"
    protocol   = "icmp"
    cidr_block = "128.0.0.0/16"
    from_port  = 0
    to_port    = 0
    icmp_code  = -1
    icmp_type  = -1
  }

  # egress {
  #   rule_no    = 300
  #   protocol   = "udp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  # egress {
  #   rule_no    = 301
  #   protocol   = "tcp"
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }
  egress {
    protocol   = -1
    rule_no    = 1000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    "Name" = "oregon_database_nacl"
  }
}