include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/load-balancer.git"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "public-subnets" {
  config_path = "../public-subnets"
}

dependency "security-group" {
  config_path = "../security-group"
}

inputs = {
  load_balancer_name = "alb-dev"
  load_balancer_type = "application"
  is_internal = false
  security_group_ids = [dependency.security-group.outputs.security_group_id]
  subnet_ids = [
    dependency.public-subnets.outputs.public_subnets[0],
    dependency.public-subnets.outputs.public_subnets[1]
  ]
  tags = {}
}
