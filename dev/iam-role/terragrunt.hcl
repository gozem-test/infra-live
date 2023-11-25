include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/iam-role.git"
}

inputs = {
  principals = [
    {
      type = "Service"
      identifiers = "ec2.amazonaws.com"
    }
  ]
  policy_name = "CloudWatchLogsPermissionsPolicy"
  role_name = "EC2InstanceProfileRole"
}
