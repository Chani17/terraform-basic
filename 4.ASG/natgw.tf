resource "aws_eip" "nat-2a" {
  vpc      = true
}

resource "aws_eip" "nat-2c" {
  vpc      = true
}

resource "aws_nat_gateway" "natgw-2a" {
  allocation_id = aws_eip.nat-2a.id
  subnet_id     = aws_subnet.sub-pub1-10-0-1-0.id

  tags = {
    Name = "gw NAT-2a"
  }
}

resource "aws_nat_gateway" "natgw-2c" {
  allocation_id = aws_eip.nat-2c.id
  subnet_id     = aws_subnet.sub-pub2-10-0-2-0.id

  tags = {
    Name = "gw NAT-2c"
  }
}