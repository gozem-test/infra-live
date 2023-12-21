include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/null-resource.git"
}

dependency "asg" {
  config_path = "../asg"
}

inputs = {
  commands = [
    "echo ${jsonencode(dependency.asg.outputs.instance_public_ips[0])} >> public_ips.txt",
    "echo ${jsonencode(dependency.asg.outputs.instance_public_ips[1])} >> public_ips.txt"
  ]
}
