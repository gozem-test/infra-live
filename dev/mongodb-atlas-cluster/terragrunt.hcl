include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/mongodb-atlas-cluster.git"
}

inputs = {
  MONGODB_ATLAS_PUBLIC_KEY = "pmcctfoj"
  MONGODB_ATLAS_PRIVATE_KEY = "b941f0ae-30e3-4b8b-a8eb-2073b84aa346"
  atlas_project_id = "655ff1624f894a484afd90b0"
  cluster_name = "gozem-test"
  cluster_type = "REPLICASET"
  provider_name = "TENANT"
  backing_provider_name = "AWS"
  provider_region_name = "US_EAST_1"
  provider_instance_size_name = "M2"
  node_count = 3
  priority = 7
}
