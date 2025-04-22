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

resource "aws_s3_bucket" "dic-prod-bucket" {
  bucket = "just-created-for-tp"
}