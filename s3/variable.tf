variable "create_s3" {
    type = bool
    default = true
    
}

variable "bucket_name" {
    type = string
  
}

variable "s3_tags" {
  type = map(string)
  default = {}
}

variable "versioning" {
    type = bool
}

variable "kms_key_arn" {
    type = string
  
}