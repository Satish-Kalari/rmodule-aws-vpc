# available zone (region) is alreday given in provider.tf in child/user module, dose not need here 
# aws_availability_zones is for all_availability_zones
# aws_availability_zone is for one specific zone

data "aws_availability_zones" "azs" {
    #all_availability_zones = true 
    state = "available"     
}

data "aws_vpc" "default" {
    default = true
  }

# Getting aws default route table id
data "aws_route_table" "default" {
    vpc_id = data.aws_vpc.default.id
    filter {
      name = "association.main"
      values = ["true"]
    }  
}