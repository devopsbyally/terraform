output "instance_id" {
  value = aws_instance.example.id
}

# OUTPUT the Elastic IP address
output "elastic_ip" {
  value = aws_eip.example[*].public_ip
}

# OUTPUT the EBS VOLUME
output "ebs_volume_id" {
  value = aws_ebs_volume.additional[*].id
  
}