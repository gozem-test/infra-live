include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/autoscaling-group.git"
}

dependency "public-subnets" {
  config_path = "../public-subnets"
}

dependency "alb-target-group" {
  config_path = "../alb-target-group"
}

dependency "launch-template" {
  config_path = "../launch-template"
}

inputs = {
  asg_name = "asg-dev"
  vpc_zone_identifier = [
    dependency.public-subnets.outputs.public_subnets[0],
    dependency.public-subnets.outputs.public_subnets[1]
  ]
  desired_capacity = 2
  max_size = 4
  min_size = 2
  health_check_type = "ELB"
  target_group_arns = [dependency.alb-target-group.outputs.arn]
  launch_template_id = dependency.launch-template.outputs.id
  launch_template_version = dependency.launch-template.outputs.latest_version
}
