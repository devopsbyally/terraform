variable "org" {
  type = string

}

variable "env" {
  type = string
 
}

variable "application" {
  type = string
 
}

variable "use_case" {
  type = string
 
}

variable "create_s3" {
    type = bool
    default = true
    
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