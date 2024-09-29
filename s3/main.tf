resource "aws_s3_bucket" "example" {
  count = var.create_s3 ? 1 : 0  # ? is called a ternary
  bucket = var.bucket_name
  force_destroy = true
  tags = var.s3_tags
}


# this is versioning block based on variable value = enabled or disabled
resource "aws_s3_bucket_versioning" "example" {
    count = var.create_s3 ? 1 : 0
    bucket = aws_s3_bucket.example[count.index].id
  versioning_configuration {
    status = var.versioning ? "Enabled" : "Disabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  count  = var.create_s3 && var.kms_key_arn != "" ? 1 : 0  # && - this means both conditions should be true # "" - means empty string
  #if true then value = 1 , if false then value = 0 but both conditions should be true. 
  bucket = aws_s3_bucket.example[count.index].id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}


#ADDITIONAL RESOURSES FOR DYNAMIC INBOUND RULES
resource "aws_security_group" "this" {
  name = var.name
  description = var.description

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = "tcp"
      cidr_blocks = [ingress.value.cidr]
      description = ingress.value.description
    }
  }
}

