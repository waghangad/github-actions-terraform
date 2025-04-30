output "created_s3_bucket_arn" {
   description = "The ARN of the created S3 Bucket."
   value       = module.create_s3_bucket.bucket_arn
}