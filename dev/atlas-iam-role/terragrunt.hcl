include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/iam-role.git"
}

dependency "atlas-account" {
  config_path = "../mongodb-atlas-cloud-provider-access-setup"
}

dependency "kms-key" {
  config_path = "../kms-key"
}

inputs = {
  principals = [
    {
      type = "AWS"
      identifiers = [dependency.atlas-account.outputs[0].atlas_aws_account_arn]
    }
  ]
  policy_name = "AtlasPermissionsPolicy"
  policy_statements = [
    {
      sid = "AtlasPermissions"
      actions = ["kms:*"]
      resources = [dependency.kms-key.outputs.arn]
    }
  ]
  role_name = "AtlasPermissionsRole"
}
