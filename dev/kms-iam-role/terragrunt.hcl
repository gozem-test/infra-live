include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/iam-role.git"
}

dependency "kms-key" {
  config_path = "../kms-key"
}

inputs = {
  principals = [
    {
      type = "Service"
      identifiers = ["kms.amazonaws.com"]
    }
  ]
  policy_name = "KMSPermissionsPolicy"
  policy_statements = [
    {
      sid = "KMSPermissions"
      actions = ["kms:*"]
      resources = [dependency.kms-key.outputs.arn]
    }
  ]
  role_name = "KMSPermissionsRole"
}
