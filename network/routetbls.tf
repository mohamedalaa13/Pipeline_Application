#Route Table Public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.iti-network.id

  tags = {
    Name = "public"
  }
}

#Route Table Private
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.iti-network.id

  tags = {
    Name = "private"
  }
}

#Route Public
resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.public-net.id
}

# #Route Private
# resource "aws_route" "private" {
#   route_table_id            = aws_route_table.private.id
#   destination_cidr_block    = "0.0.0.0/0"
#   nat_gateway_id = aws_internet_gateway.private-nat.id
# }

#public Association
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.public.id
}