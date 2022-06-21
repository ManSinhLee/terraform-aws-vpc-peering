resource "aws_route_table_association" "virginia_public_rtb_association" {
  provider       = aws.virginia
  count          = length(data.aws_availability_zones.virginia_available.names)
  subnet_id      = element(aws_subnet.virginia_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.virginia_public_rtb.id
}

resource "aws_route_table_association" "virginia_private_rtb_association" {
  provider       = aws.virginia
  count          = length(data.aws_availability_zones.virginia_available.names)
  subnet_id      = element(aws_subnet.virginia_private_subnet.*.id, count.index)
  route_table_id = aws_route_table.virginia_private_rtb.id
}

resource "aws_route_table_association" "virginia_database_rtb_association" {
  provider       = aws.virginia
  count          = length(data.aws_availability_zones.virginia_available.names)
  subnet_id      = element(aws_subnet.virginia_database_subnet.*.id, count.index)
  route_table_id = aws_route_table.virginia_database_rtb.id
}

resource "aws_route_table_association" "oregon_public_rtb_association" {
  provider       = aws.oregon
  count          = length(data.aws_availability_zones.oregon_available.names)
  subnet_id      = element(aws_subnet.oregon_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.oregon_public_rtb.id
}

resource "aws_route_table_association" "oregon_private_rtb_association" {
  provider       = aws.oregon
  count          = length(data.aws_availability_zones.oregon_available.names)
  subnet_id      = element(aws_subnet.oregon_private_subnet.*.id, count.index)
  route_table_id = aws_route_table.oregon_private_rtb.id
}

resource "aws_route_table_association" "oregon_database_rtb_association" {
  provider       = aws.oregon
  count          = length(data.aws_availability_zones.oregon_available.names)
  subnet_id      = element(aws_subnet.oregon_database_subnet.*.id, count.index)
  route_table_id = aws_route_table.oregon_database_rtb.id
}