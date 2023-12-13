include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/vpc.git"
}

inputs = {
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "vpc-dev-2"
  enable_dns_hostnames = true
  vpc_tags = {}
}
