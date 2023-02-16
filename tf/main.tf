
data "terraform_remote_state" "backend" {
  backend = "s3"
  config = {
    bucket = module.backend.bucket_id
    key    = "backend/terraform.tfstate"
    region = "us-west-1"
  }
}

module "backend" {
  source = "./backend"

  bucket_id = module.backend.bucket_id
}