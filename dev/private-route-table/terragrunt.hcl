include "root" {
  path = find_in_parent_folders()
}

terraform {
  // source = "git@github.com:gozem-test/route-table.git"
  source = "git::https://github.com/gozem-test/route-table.git"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  route_tables = [
    {
      name      = "private-rt-dev"
      vpc_id    = dependency.vpc.outputs.vpc_id
      is_igw_rt = false

      routes = []

      tags = {}
    }
  ]
}
