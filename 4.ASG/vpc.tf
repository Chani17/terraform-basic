resource "aws_vpc" "vpc-10-0-0-0" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-10-0-0-0"
  }
}

resource "aws_subnet" "sub-pub1-10-0-1-0" {
  vpc_id     = aws_vpc.vpc-10-0-0-0.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "sub-pub1-10-0-1-0"
  }
}

resource "aws_subnet" "sub-pub2-10-0-2-0" {
  vpc_id     = aws_vpc.vpc-10-0-0-0.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "sub-pub2-10-0-2-0"
  }
}

resource "aws_subnet" "sub-pri1-10-0-3-0" {
  vpc_id     = aws_vpc.vpc-10-0-0-0.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "sub-pri1-10-0-3-0"
  }
}

resource "aws_subnet" "sub-pri2-10-0-4-0" {
  vpc_id     = aws_vpc.vpc-10-0-0-0.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "sub-pri2-10-0-4-0"
  }
}

resource "aws_internet_gateway" "igw-vpc-10-0-0-0" {
  vpc_id = aws_vpc.vpc-10-0-0-0.id

  tags = {
    Name = "igw-vpc-10-0-0-0"
  }
}