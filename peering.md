# aws_vpc_peering_connection
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection

If peering required

Need VPC IDs for which we need peering 
    - If user provide peering VPC IDs, use them
    - if not we will create peering between aws default VPC and Project VPC

requester VPC is roboshop
acceptor VPC would be either default aws vpc or user provided VPC 

Terraform provides both a standalone VPC Peering Connection Options and a VPC Peering Connection resource with accepter and requester attributes. 

Do not manage options for the same VPC peering connection in both a VPC Peering Connection resource and a VPC Peering Connection Options resource. Doing so will cause a conflict of options and will overwrite the options. 

Using a VPC Peering Connection Options resource decouples management of the connection options from management of the VPC Peering Connection and allows options to be set correctly in cross-account scenarios.

