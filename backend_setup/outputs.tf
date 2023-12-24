
output "aws_s3_bucket_ids" {
  description = "S3 Bucket ID"
  value       = aws_s3_bucket.buckets[*].id
}

output "aws_s3_bucket_names" {
  description = "S3 Bucket Names"
  value       = aws_s3_bucket.buckets[*].arn
}
