terraform {
  backend "s3" {
    bucket       = "saipatlolla-order-service-terraform-state"
    key          = "order-service/qa/terraform.tfstate"
    region       = "eu-north-1"
    use_lockfile = true
    encrypt      = true
  }
}
