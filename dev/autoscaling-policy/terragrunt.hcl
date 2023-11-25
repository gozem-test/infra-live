include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/autoscaling-policy.git"
}

dependency "asg" {
  config_path = "../asg"
}

inputs = {
  scaling_policy_name = "CPUUtilization"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  asg_name = dependency.asg.outputs.name
}
