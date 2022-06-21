resource "aws_instance" "virginia_public_web_1a" {
  provider               = aws.virginia
  ami                    = "ami-065efef2c739d613b"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.virginia_key_pair.key_name
  subnet_id              = aws_subnet.virginia_public_subnet[0].id
  vpc_security_group_ids = [aws_security_group.virginia_public_sg.id]

  tags = {
    "Name"     = "virginia_public_web_1a",
    "UserName" = "CloudMan"
  }
}

resource "aws_instance" "oregon_public_web_1a" {
  provider               = aws.oregon
  ami                    = "ami-098e42ae54c764c35"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.oregon_key_pair.key_name
  subnet_id              = aws_subnet.oregon_public_subnet[0].id
  vpc_security_group_ids = [aws_security_group.oregon_public_sg.id]

  tags = {
    "Name"     = "oregon_public_web_1a",
    "UserName" = "CloudMan"
  }
}

resource "aws_instance" "virginia_private_app_1a" {
  provider               = aws.virginia
  ami                    = "ami-065efef2c739d613b"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.virginia_key_pair.key_name
  subnet_id              = aws_subnet.virginia_private_subnet[0].id
  vpc_security_group_ids = [aws_security_group.virginia_private_sg.id]

  tags = {
    "Name"     = "virginia_private_app_1a",
    "UserName" = "CloudMan"
  }
}

resource "aws_instance" "oregon_private_app_1a" {
  provider               = aws.oregon
  ami                    = "ami-098e42ae54c764c35"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.oregon_key_pair.key_name
  subnet_id              = aws_subnet.oregon_private_subnet[0].id
  vpc_security_group_ids = [aws_security_group.oregon_private_sg.id]

  tags = {
    "Name"     = "oregon_private_app_1a",
    "UserName" = "CloudMan"

  }
}