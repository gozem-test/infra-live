include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/kms-key.git"
}

inputs = {
  description = "Gozem Test KMS Key"
}
