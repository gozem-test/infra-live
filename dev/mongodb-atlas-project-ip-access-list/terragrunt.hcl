include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/mongodb-atlas-project-ip-access-list.git"
}

inputs = {
  MONGODB_ATLAS_PUBLIC_KEY = "pmcctfoj"
  MONGODB_ATLAS_PRIVATE_KEY = "b941f0ae-30e3-4b8b-a8eb-2073b84aa346"
  // org_id = "655ff14bafb5120f9bfd26c5"
  // api_key_id = "655ff2f5998b7c7363bd39da"
  project_id = "655ff1624f894a484afd90b0"
  cidr_block = "0.0.0.0/0" # Restrict this
  comment = "Open Access List"
}
