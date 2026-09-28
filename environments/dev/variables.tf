variable "aws_region" {
  type = string
}

variable "ami" {
  type = string
}


variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "dev_vms" {
  type = map(object({
    instance_type = string
    instance_name = string
  }))
}

variable "environment" {
  type = string
}
