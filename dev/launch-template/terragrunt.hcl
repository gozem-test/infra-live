include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/launch-template.git"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "security-group" {
  config_path = "../security-group"
}

dependency "instance-profile" {
  config_path = "../instance-profile"
}

dependency "key-pair" {
  config_path = "../key-pair"
}

inputs = {
  most_recent_ami = true
  owners = ["amazon"]
  ami_name_filter = "name"
  ami_values_filter = ["al2023-ami-2023.*-x86_64"]
  template_name = "app-dev"
  template_description = "Launch template to to spin up Node.js web server"
  instance_type = "t2.micro"
  use_ssh = true
  key_name = dependency.key-pair.outputs.key_name
  use_userdata = true
  userdata_script_path = "user-data.sh"
  vpc_security_group_ids = [dependency.security-group.outputs.security_group_id]
  use_instance_profile = true
  instance_profile_arn = dependency.instance-profile.outputs.arn
  template_tags = {}
}
