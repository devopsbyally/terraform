#EC2
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
  default = "t2.micro" 
}
variable "subnet_id" {
  type = string
}
variable "security_group" {
  type = string
}
variable "application" {
  type = string
}
variable "env" {
  description = "i.e, dev,prod,stage,etc..."
  type = string
}
variable "instance_profile_arn" {
  description = "IAM Instance profile ARN (if any)"
  type        = string
  default     = ""
}
variable "user_data" {
  description = "User data script for instance setup"
  type        = string
  default     = ""
}
variable "key_name" {
  description = "Key pair"
  type        = string
  default     = null
}

#ELASTICIP - IF VALUE IS TRUE, IT WILL CREATE IT AND ATTACH TO EC2
variable "create_elastic_ip" {
  type = bool
  default = false
}

#EBS VOLUME
variable "create_ebs_volume" {
  type  = bool
  default = false
}

variable "ebs_volume_size" {
  type = number
  default = 5
}