resource "aws_route_table" "virginia_public_rtb" {
  provider = aws.virginia
  vpc_id   = aws_vpc.virginia_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.virginia_igw.id
  }
  route {
    cidr_block                = "128.0.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.virginia_to_oregon_peer_conn.id
  }
  tags = {
    "Name" = "virginia_public_rtb"
  }
}

resource "aws_route_table" "virginia_private_rtb" {
  provider = aws.virginia
  vpc_id   = aws_vpc.virginia_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.virginia_nat_gateway.id
  }
  route {
    cidr_block                = "128.0.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.virginia_to_oregon_peer_conn.id
  }
  tags = {
    "Name" = "virginia_private_rtb"
  }
}

resource "aws_route_table" "virginia_database_rtb" {
  provider = aws.virginia
  vpc_id   = aws_vpc.virginia_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.virginia_nat_gateway.id
  }
  route {
    cidr_block                = "128.0.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.virginia_to_oregon_peer_conn.id
  }
  tags = {
    "Name" = "virginia_database_rtb"
  }
}

resource "aws_route_table" "oregon_public_rtb" {
  provider = aws.oregon
  vpc_id   = aws_vpc.oregon_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.oregon_igw.id
  }
  route {
    cidr_block                = "10.0.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.virginia_to_oregon_peer_conn.id
  }

  tags = {
    "Name" = "oregon_public_rtb"
  }
}

resource "aws_route_table" "oregon_private_rtb" {
  provider = aws.oregon
  vpc_id   = aws_vpc.oregon_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.oregon_nat_gateway.id
  }
  route {
    cidr_block                = "10.0.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.virginia_to_oregon_peer_conn.id
  }

  tags = {
    "Name" = "oregon_private_rtb"
  }
}

resource "aws_route_table" "oregon_database_rtb" {
  provider = aws.oregon
  vpc_id   = aws_vpc.oregon_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.oregon_nat_gateway.id
  }
  route {
    cidr_block                = "10.0.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.virginia_to_oregon_peer_conn.id
  }

  tags = {
    "Name" = "oregon_database_rtb"
  }
}