include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/null-resource.git"
}

dependency "cloudwatch-alarm" {
  config_path = "../cloudwatch-metric-alarm"
}

inputs = {
  commands = [
    <<EOF
    echo 'All done!'
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
