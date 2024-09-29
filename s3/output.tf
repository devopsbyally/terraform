output "s3_bucket_name" {
  value = aws_s3_bucket.example[*].id
}

#OUTPUT FOR INBOUND DYNAMIC RULES
output "security_group_id" {
  description = "SG OF ID"
  value = aws_security_group.this.id
}