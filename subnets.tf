resource "aws_subnet" "virginia_public_subnet" {
  vpc_id                  = aws_vpc.virginia_vpc.id
  count                   = length(data.aws_availability_zones.virginia_available.names)
  cidr_block              = "10.0.${count.index}.0/24"
  availability_zone       = element(data.aws_availability_zones.virginia_available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    "Name" = "virginia_public_subnet_${element(data.aws_availability_zones.virginia_available.names, count.index)}"
  }
}

resource "aws_subnet" "virginia_private_subnet" {
  vpc_id                  = aws_vpc.virginia_vpc.id
  count                   = length(data.aws_availability_zones.virginia_available.names)
  cidr_block              = "10.0.${length(data.aws_availability_zones.virginia_available.names) + count.index}.0/24"
  map_public_ip_on_launch = false
  availability_zone       = element(data.aws_availability_zones.virginia_available.names, count.index)
  tags = {
    Name = "virginia_private_subnet_${element(data.aws_availability_zones.virginia_available.names, count.index)}"
  }
}

resource "aws_subnet" "virginia_database_subnet" {
  vpc_id                  = aws_vpc.virginia_vpc.id
  cidr_block              = "10.0.${2 * length(data.aws_availability_zones.virginia_available.names) + count.index}.0/24"
  map_public_ip_on_launch = false
  count                   = length(data.aws_availability_zones.virginia_available.names)
  availability_zone       = element(data.aws_availability_zones.virginia_available.names, count.index)
  tags = {
    Name = "virginia_database_subnet_${element(data.aws_availability_zones.virginia_available.names, count.index)}"
  }
}


resource "aws_subnet" "oregon_public_subnet" {
  provider                = aws.oregon
  vpc_id                  = aws_vpc.oregon_vpc.id
  count                   = length(data.aws_availability_zones.oregon_available.names)
  cidr_block              = "128.0.${count.index}.0/24"
  availability_zone       = element(data.aws_availability_zones.oregon_available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    "Name" = "oregon_public_subnet_${element(data.aws_availability_zones.oregon_available.names, count.index)}"
  }
}

resource "aws_subnet" "oregon_private_subnet" {
  provider                = aws.oregon
  vpc_id                  = aws_vpc.oregon_vpc.id
  count                   = length(data.aws_availability_zones.oregon_available.names)
  cidr_block              = "128.0.${length(data.aws_availability_zones.oregon_available.names) + count.index}.0/24"
  map_public_ip_on_launch = false
  availability_zone       = element(data.aws_availability_zones.oregon_available.names, count.index)
  tags = {
    Name = "oregon_private_subnet_${element(data.aws_availability_zones.oregon_available.names, count.index)}"
  }
}

resource "aws_subnet" "oregon_database_subnet" {
  provider                = aws.oregon
  vpc_id                  = aws_vpc.oregon_vpc.id
  cidr_block              = "128.0.${2 * length(data.aws_availability_zones.oregon_available.names) + count.index}.0/24"
  map_public_ip_on_launch = false
  count                   = length(data.aws_availability_zones.oregon_available.names)
  availability_zone       = element(data.aws_availability_zones.oregon_available.names, count.index)
  tags = {
    Name = "oregon_database_subnet_${element(data.aws_availability_zones.oregon_available.names, count.index)}"
  }
}