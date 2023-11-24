include "root" {
  path = find_in_parent_folders()
}

terraform {
  // source = "git@github.com:gozem-test/security-group.git"
  source = "git::https://github.com/gozem-test/security-group.git"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "public-subnets" {
  config_path = "../public-subnets"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
  name = "public-sg"
  description = "Open security group"
  ingress_rules = [
    {
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress_rules = [
    {
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  tags = {}
}
