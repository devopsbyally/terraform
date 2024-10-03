resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group]  # has to have [] , otherwise wont work.
  iam_instance_profile = var.instance_profile_arn != "" ? var.instance_profile_arn : null
  key_name = var.key_name
  user_data = var.user_data != "" ? var.user_data : null

  tags = {
    Name = "${var.application}-${var.env}-ec2"
  }
}

#Create Elastic IP
resource "aws_eip" "example" {
  count = var.create_elastic_ip ? 1 : 0
  instance = aws_instance.example.id
}

# Create an EBS volume if specified
resource "aws_ebs_volume" "additional" {
  count = var.create_ebs_volume ? 1 : 0
  availability_zone = aws_instance.example.availability_zone
  size = var.ebs_volume_size

  tags = {
    Name = "${var.application}-${var.env}-additional-ebs"
  }
}

# Attach the EBS volume to the EC2 instance
resource "aws_volume_attachment" "attach_additional" {
  count = var.create_ebs_volume ? 1 : 0
  device_name = "/dev/sda"
  volume_id = aws_ebs_volume.additional[0].id
  instance_id = aws_instance.example.id
}
