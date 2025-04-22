# github-actions-terraform
GitHub Actions Workflow for Terraform Deployment.

Terrafrom with AWS S3 to store tf.state file & AWS DynamoDB to store lock.

1. Create AWS DynamoDB table with name tf.lock with LockID (String) is Partition key.
2. Create AWS S3 bucket to use as Terraform backend to store tf.state file.
3. Use and Code Repository to store terraform code.
4. Create GitHub Actions workflow to deploy terraform.