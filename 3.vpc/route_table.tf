resource "aws_route_table" "rt-pub-vpc-10-0-0-0" {
  vpc_id = aws_vpc.vpc-10-0-0-0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-vpc-10-0-0-0.id
  }
  
  tags = {
    Name = "rt-pub-vpc-10-0-0-0"
  }
}

resource "aws_route_table_association" "rt-pub-as1-vpc-10-0-0-0" {
  subnet_id      = aws_subnet.sub-pub1-10-0-1-0.id
  route_table_id = aws_route_table.rt-pub-vpc-10-0-0-0.id
}

resource "aws_route_table_association" "rt-pub-as2-vpc-10-0-0-0" {
  subnet_id      = aws_subnet.sub-pub2-10-0-2-0.id
  route_table_id = aws_route_table.rt-pub-vpc-10-0-0-0.id
}

resource "aws_route_table" "rt-pri1-vpc-10-0-0-0" {
  vpc_id = aws_vpc.vpc-10-0-0-0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw-2a.id
  }

  tags = {
    Name = "rt-pri1-vpc-10-0-0-0"
  }
}

resource "aws_route_table" "rt-pri2-vpc-10-0-0-0" {
  vpc_id = aws_vpc.vpc-10-0-0-0.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw-2c.id
  }
  
  tags = {
    Name = "rt-pri2-vpc-10-0-0-0"
  }
}

resource "aws_route_table_association" "rt-pri1-as1-vpc-10-0-0-0" {
  subnet_id      = aws_subnet.sub-pri1-10-0-3-0.id
  route_table_id = aws_route_table.rt-pri1-vpc-10-0-0-0.id
}

resource "aws_route_table_association" "rt-pri2-as2-vpc-10-0-0-0" {
  subnet_id      = aws_subnet.sub-pri2-10-0-4-0.id
  route_table_id = aws_route_table.rt-pri2-vpc-10-0-0-0.id
}

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