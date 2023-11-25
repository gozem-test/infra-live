include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/iam-role.git"
}

inputs = {
  assume_role_service_type = "Service"
  assume_role_service_identifiers = "ec2.amazonaws.com"
  policy_name = "CloudWatchLogsPermissionsPolicy"
  role_name = "EC2InstanceProfileRole"
}
