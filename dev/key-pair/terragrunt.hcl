include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:gozem-test/key-pair.git"
}

inputs = {
  key_name = "SSH key pair"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMlQHyDcvxG9AIZJtQus+z/jjbgvLF41UphznNYtDcRt stephanenoutsak@gmail.com" # Replace with your own public key
  tags = {}
}
