include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/mongodb-atlas-encryption-at-rest.git"
}

dependency "kms-key" {
  config_path = "../kms-key"
}

dependency "access-setup" {
  config_path = "../mongodb-atlas-cloud-provider-access-setup"
}

inputs = {
  MONGODB_ATLAS_PUBLIC_KEY = "pmcctfoj"
  MONGODB_ATLAS_PRIVATE_KEY = "b941f0ae-30e3-4b8b-a8eb-2073b84aa346"
  atlas_project_id = "655ff1624f894a484afd90b0"
  aws_kms_config = {
    enabled = true
    customer_master_key_id = dependency.kms-key.outputs.key_id
    region = "US_EAST_1"
    role_id = dependency.access-setup.outputs.role_id
  }
}
