module "ec2" {
  for_each = var.dev_vms
  source   = "../../modules/ec2"

  ami                = var.ami
  instance_type      = each.value.instance_type
  subnet_id          = var.subnet_id
  security_group_ids = var.security_group_ids
  key_name           = var.key_name
  instance_name      = each.value.instance_name
  environment        = var.environment
}
