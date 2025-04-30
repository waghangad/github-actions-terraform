terraform {
  backend "s3" {
    bucket         = "tf-state-123456789"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf.lock"
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "create_s3_bucket" {
    source        = "./modules/s3"
    bucket_name   = var.bucket_name
}