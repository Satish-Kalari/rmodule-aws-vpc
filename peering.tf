resource "aws_vpc_peering_connection" "peering" {
  # In this module default value for is_peering_required is false means its 0 and peering will not run
  # If user of this module says is_peering_required is true in his var file then the value 1, so peering will run one time
  count = var.is_peering_required ? 1 : 0
  # The ID of the requester VPC peering connection.
  vpc_id = aws_vpc.main.id 
  # The ID of the Accepter VPC peering connection.
  # if var.acceptor_vpc_id is empty (== ""), then use default aws vpc id 
  peer_vpc_id = var.acceptor_vpc_id == "" ? data.aws_vpc.default.id : var.acceptor_vpc_id
  # if var.acceptor_vpc_id is empty (== ""), auto accept in enabled
  auto_accept = var.acceptor_vpc_id == "" ? true : false
  tags = merge(
    var.common_tags,
    var.vpc_peering_tags,
    {
        Name = "${local.name}"
    }
  ) 
}

  resource "aws_route" "acceptor_route" {
    # when is_peering_required= true and acceptor_vpc_id is available then routes created
    count = var.is_peering_required && var.acceptor_vpc_id == "" ? 1 : 0
    # Default VPC route table id
    route_table_id            = data.aws_route_table.default.id 
    # Roboshop VPC cird
    destination_cidr_block    = var.vpc_cidr
    # since count function is in resource block, even though there only one peering conneaction we need to mention here [0]
    vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id 
}

  resource "aws_route" "public_peering" {
    count = var.is_peering_required && var.acceptor_vpc_id == "" ? 1 : 0
    route_table_id            = aws_route_table.public.id
    destination_cidr_block    = data.aws_vpc.default.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id 
}

  resource "aws_route" "private_peering" {
    count = var.is_peering_required && var.acceptor_vpc_id == "" ? 1 : 0
    route_table_id            = aws_route_table.private.id
    destination_cidr_block    = data.aws_vpc.default.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id 
}

 resource "aws_route" "database_peering" {
    count = var.is_peering_required && var.acceptor_vpc_id == "" ? 1 : 0
    route_table_id            = aws_route_table.database.id
    destination_cidr_block    = data.aws_vpc.default.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id 
}