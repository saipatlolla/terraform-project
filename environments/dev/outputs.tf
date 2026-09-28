output "ec2_instance_id" {
  value = {
    for name, vm in module.ec2 : name => vm.instance_id
  }
}

output "ec2_private_ip" {
  value = {
    for name, vm in module.ec2 : name => vm.private_ip
  }
}

output "ec2_public_ip" {
  value = {
    for name, vm in module.ec2 : name => vm.public_ip
  }
}
