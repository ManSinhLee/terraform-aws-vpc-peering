resource "aws_key_pair" "virginia_key_pair" {
  provider   = aws.virginia
  key_name   = "man-sinh-le"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_key_pair" "oregon_key_pair" {
  provider   = aws.oregon
  key_name   = "man-sinh-le"
  public_key = file("~/.ssh/id_rsa.pub")
}