include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/subnet.git"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "private-route-table" {
  config_path = "../private-route-table"
}

inputs = {
  subnets = [
    {
      name                                = "private-subnet-1"
      vpc_id                              = dependency.vpc.outputs.vpc_id
      cidr_block                          = "10.0.100.0/24"
      availability_zone                   = "us-east-1a"
      map_public_ip_on_launch             = false
      private_dns_hostname_type_on_launch = "resource-name"
      is_public                           = false
      route_table_id                      = dependency.private-route-table.outputs.route_table_ids[0]
      tags                                = {}
    },

    {
      name                                = "private-subnet-2"
      vpc_id                              = dependency.vpc.outputs.vpc_id
      cidr_block                          = "10.0.200.0/24"
      availability_zone                   = "us-east-1b"
      map_public_ip_on_launch             = false
      private_dns_hostname_type_on_launch = "resource-name"
      is_public                           = false
      route_table_id                      = dependency.private-route-table.outputs.route_table_ids[0]
      tags                                = {}
    }
  ]
}
