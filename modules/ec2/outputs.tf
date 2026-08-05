output "instance_id" {
  value = aws_instance.test_vm.id
}

output "public_ip" {
  value = aws_instance.test_vm.public_ip
}

output "private_ip" {
  value = aws_instance.test_vm.private_ip
}
