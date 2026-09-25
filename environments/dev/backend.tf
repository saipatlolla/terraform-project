terraform {
  backend "s3" {
    bucket       = "saipatlolla-order-service-terraform-state"
    key          = "order-service/dev/terraform.tfstate"
    region       = "eu-north-1"
    use_lockfile = true
    encrypt      = true
  }
}
