include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/load-balancer-listener.git"
}

dependency "alb" {
  config_path = "../alb"
}

dependency "alb-target-group" {
  config_path = "../alb-target-group"
}

inputs = {
  load_balancer_arn               = dependency.alb.outputs.arn
  port                            = 80
  protocol                        = "HTTP"
  default_action_target_group_arn = dependency.alb-target-group.outputs.arn
  listener_tags                   = {
    Name          = "alb-default-listener-dev"
    description   = "Application Load Balancer Default 80 Listener"
  }
}
