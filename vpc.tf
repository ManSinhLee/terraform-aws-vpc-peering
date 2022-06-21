resource "aws_vpc" "virginia_vpc" {
  provider             = aws.virginia
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "virginia_vpc"
  }
}

resource "aws_vpc" "oregon_vpc" {
  provider             = aws.oregon
  cidr_block           = "128.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "oregon_vpc"
  }
}