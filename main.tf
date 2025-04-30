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

# S3 bucket
# ----------

module "create_s3_bucket" {
    source        = "./modules/s3"
    bucket_name   = var.bucket_name
}

# EKS Auto mode 
# -------------

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "study-eks-cluster"
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access = false

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
  }

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = "vpc-0f1ef7f44c5098ddb"
  subnet_ids = ["subnet-00c853ba29eb48d3c", "subnet-0b12c0cac23004261"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}