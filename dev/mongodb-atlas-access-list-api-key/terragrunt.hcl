include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/mongodb-atlas-access-list-api-key.git"
}

inputs = {
  MONGODB_ATLAS_PUBLIC_KEY = "pmcctfoj"
  MONGODB_ATLAS_PRIVATE_KEY = "b941f0ae-30e3-4b8b-a8eb-2073b84aa346"
  org_id = "655ff14bafb5120f9bfd26c5"
  cidr_block = "0.0.0.0/0" # Restrict this
  api_key_id = "gozem_test_snk"
}
