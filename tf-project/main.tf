provider "aws" {
  region = var.region
}

output "frontend_ec2_ip" {
  value = aws_instance.tf_frontend.public_ip
}

output "backend_ec2_ip" {
  value = aws_instance.tf_backend.private_ip
}

output "bastion_ec2_ip" {
  value = aws_instance.tf_bastion.public_ip
}
