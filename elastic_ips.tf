resource "aws_eip" "virginia_nat_eip" {
  provider   = aws.virginia
  vpc        = true
  depends_on = [aws_internet_gateway.virginia_igw]
  tags = {
    "Name"     = "virginia_nat_eip",
    "UserName" = "CloudMan"
  }
}

resource "aws_eip" "oregon_nat_eip" {
  provider   = aws.oregon
  vpc        = true
  depends_on = [aws_internet_gateway.oregon_igw]
  tags = {
    "Name"     = "oregon_nat_eip",
    "UserName" = "CloudMan"
  }
}