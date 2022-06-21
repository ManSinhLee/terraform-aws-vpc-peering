resource "aws_internet_gateway" "virginia_igw" {
  provider = aws.virginia
  vpc_id   = aws_vpc.virginia_vpc.id
  tags = {
    "Name" = "virginia_igw"
  }
}

resource "aws_internet_gateway" "oregon_igw" {
  provider = aws.oregon
  vpc_id   = aws_vpc.oregon_vpc.id
  tags = {
    "Name" = "oregon_igw"
  }
}