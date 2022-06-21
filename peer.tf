resource "aws_vpc_peering_connection" "virginia_to_oregon_peer_conn" {
  provider    = aws.virginia
  vpc_id      = aws_vpc.virginia_vpc.id
  peer_vpc_id = aws_vpc.oregon_vpc.id
  peer_region = var.oregon
}

resource "aws_vpc_peering_connection_accepter" "virginia_to_oregon_peer_conn_accepter" {
  provider                  = aws.oregon
  vpc_peering_connection_id = aws_vpc_peering_connection.virginia_to_oregon_peer_conn.id
  auto_accept               = true
}