include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/iam-role.git"
}

dependency "atlas-account" {
  config_path = "../mongodb-atlas-cloud-provider-access-setup"
}

inputs = {
  principals = [
    {
      type = "Service"
      identifiers = ["kms.amazonaws.com"]
    }
  ]
  policy_name = "AtlasPermissionsPolicy"
  policy_statements = [
    {
      sid = "AtlasPermissions"
      actions = ["kms:*"]
      resources = [dependency.atlas-account.outputs[0].atlas_aws_account_arn]
    }
  ]
  role_name = "AtlasPermissionsRole"
}
