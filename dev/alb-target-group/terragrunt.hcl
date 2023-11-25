include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/load-balancer-target-group.git"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  target_group_name   = "alb-target-group-dev"
  port                = 80
  protocol            = "HTTP"
  vpc_id              = dependency.vpc.outputs.vpc_id
  target_type         = "instance"
  target_group_tags   = {
    description   = "Application Load Balancer Target Group"
  }
}
