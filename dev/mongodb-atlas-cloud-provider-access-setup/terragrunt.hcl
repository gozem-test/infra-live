include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/mongodb-atlas-cloud-provider-access-setup.git"
}

inputs = {
  MONGODB_ATLAS_PUBLIC_KEY = "pmcctfoj"
  MONGODB_ATLAS_PRIVATE_KEY = "b941f0ae-30e3-4b8b-a8eb-2073b84aa346"
  atlas_project_id = "655ff1624f894a484afd90b0"
  provider_name = "AWS"
}