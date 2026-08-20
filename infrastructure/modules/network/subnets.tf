resource "aws_subnet" "public" {
  for_each = var.subnet_config

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.public_cidr
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      Name                     = "${var.project_name}-${var.environment}-public-${each.key}"
      "kubernetes.io/role/elb" = "1"
    }
  )
}

resource "aws_subnet" "private" {
  for_each = var.subnet_config

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.private_cidr
  availability_zone       = each.key
  map_public_ip_on_launch = false

  tags = merge(
    var.common_tags,
    {
      Name                              = "${var.project_name}-${var.environment}-private-${each.key}"
      "kubernetes.io/role/internal-elb" = "1"
    }
  )
}