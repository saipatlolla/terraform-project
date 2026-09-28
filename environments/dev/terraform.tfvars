aws_region = "eu-north-1"

ami = "ami-030080905874ee8c9"

subnet_id = "subnet-09d0df550a87eeb10"

security_group_ids = [
  "sg-0cf15c3d65142e95b"
]

key_name = "kubernetes_practice"

dev_vms = {
  existing = {
    instance_name = "terraform-alice-vm"
    instance_type = "c7i-flex.large"
  }
}

environment = "dev"
