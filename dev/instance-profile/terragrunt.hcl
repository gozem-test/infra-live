include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/instance-profile.git"
}

dependency "iam-role" {
  config_path = "../iam-role"
}

inputs = {
  instance_profile_name = "EC2InstanceProfileForSSM"
  path = "/"
  iam_role_name = dependency.iam-role.outputs.role_name
  tags = {}
}