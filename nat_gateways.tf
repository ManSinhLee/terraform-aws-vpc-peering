resource "aws_nat_gateway" "virginia_nat_gateway" {
  provider      = aws.virginia
  allocation_id = aws_eip.virginia_nat_eip.id
  subnet_id     = aws_subnet.virginia_public_subnet[0].id
  depends_on    = [aws_internet_gateway.virginia_igw]
  tags = {
    "Name"     = "virginia_nat_gateway",
    "UserName" = "CloudMan"
  }
}

resource "aws_nat_gateway" "oregon_nat_gateway" {
  provider      = aws.oregon
  allocation_id = aws_eip.oregon_nat_eip.id
  subnet_id     = aws_subnet.oregon_public_subnet[0].id
  depends_on    = [aws_internet_gateway.oregon_igw]
  tags = {
    "Name"     = "oregon_nat_gateway",
    "UserName" = "CloudMan"
  }
}