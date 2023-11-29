include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/null-resource.git"
}

dependency "asg" {
  config_path = "../asg"
}

dependency "cluster" {
  config_path = "../mongodb-atlas-cluster"
}

inputs = {
  commands = [
    <<EOF
    echo 'All done!'
    echo '${dependency.asg.outputs.instance_public_ips}'
    EOF
  //   <<EOF
  // apt install curl && \
  // curl --version && \
  // curl -X POST \
  //   -H "Content-Type: application/json" \
  //   -d '{"vpcId": "${dependency.vpc.outputs.vpc_id}", "nacls": ${jsonencode(dependency.nacl.outputs.nacls)}}' \
  //   https://webhook.site/141bbd31-7601-4749-831c-77ef9e30aa93
  // EOF
  ]
}
