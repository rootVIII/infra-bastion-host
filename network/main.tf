
resource "aws_vpc" "dev_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags             = var.project_tags
}

resource "aws_subnet" "dev_subnet_public_1" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.vpc_public_subnet
  map_public_ip_on_launch = "true"
  availability_zone       = local.vpc_az
}

resource "aws_subnet" "dev_subnet_private_1" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.vpc_private_subnet
  map_public_ip_on_launch = "false"
  availability_zone       = local.vpc_az
}

resource "aws_eip" "eip" {
  domain = "vpc"
}

resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
}

resource "aws_nat_gateway" "dev_ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.dev_subnet_public_1.id
}

resource "aws_route_table" "dev_public_route_table" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }
}

resource "aws_route_table" "dev_private_route_table" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dev_ngw.id
  }
}

resource "aws_route_table_association" "dev_public_route_table_association" {
  route_table_id = aws_route_table.dev_public_route_table.id
  subnet_id      = aws_subnet.dev_subnet_public_1.id
}

resource "aws_route_table_association" "dev_private_route_table_association" {
  route_table_id = aws_route_table.dev_private_route_table.id
  subnet_id      = aws_subnet.dev_subnet_private_1.id
}
