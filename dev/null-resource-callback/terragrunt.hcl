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
    ls -la ~/.ssh
    ip_arr=('[aws_ec2]', '${dependency.asg.outputs.instance_public_ips[0]}', '${dependency.asg.outputs.instance_public_ips[1]}')
    printf '%s\n' ${ip_arr[@]} >> inventory.ini

    var_arr=('[aws_ec2:vars]', 'ansible_ssh_user=ec2-user', 'ansible_ssh_private_key_file=')
    echo '${var_arr}'
    echo '${dependency.asg.outputs.instance_public_ips[0]}, ${dependency.asg.outputs.instance_public_ips[1]}'
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
