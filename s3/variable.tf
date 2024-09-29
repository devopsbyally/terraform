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


#VARIABLES FOR INBOUND DYNAMIC RULES

variable "name" {
  type = string
  description = "name of sg"
}
variable "description" {
  type = string
  description = "description of sg"
}
variable "ingress_rules" {
    type = list(object({
     port = number
     cidr = string
     description = string
    }))
  
}