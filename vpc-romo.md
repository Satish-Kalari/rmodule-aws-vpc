# Steps in Module creation for Roboshop project 
Create:
1).  VPC
2).  Internet Gateway (igw)
3).  Subnets (public, private and database)
4).  Route tables
5).  Routes for Route tables 
6)   Associate routes with subnets
7).  elastic ip (eip) ***( eip is for NAT gateway)***
8).  NAT gateway ***(NAT gate way should be in any public subnet for internet access)***
9)   Add  NAT gateway route in private and database subnets ***[only-incoming-internet-access-for-private-database subnets]***
10). Peering connection between two VPCs
11). Routes 

# Tags:

A) Common Tags [applicable-to-all-resources]
        Project = roboshop
        Environment = dev
        Terraform = true
B) Resource Specific Tags
        - VPC Tags
        - Subnet Tags
        - NAT tags
        - etc.

***we can merge tags with following block*** 
tags = merge( 
    var.common_tags,
    var.vpc_tags,
    {
      Name = local.name
    }
  )

* Example folder is for how to use this module \\
