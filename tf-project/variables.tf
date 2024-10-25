variable "vpc_cidr" {
  description = "cidr block for VPC"
  default     = "10.0.0.0/16" #Cidr default rrange 
}

variable "public_subnet_cidr" {
  description = "cidr block for public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "cidr block for private subnet"
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "instance type t2.micro"
  default     = "t2.micro"
}

variable "ebs_volume_size" {
  description = "EBS volume" #EBS size is 5gb
  default     = 5
}

variable "ami_id" {
  description = "this is AMi id"
  default     = "ami-0ea3c35c5c3284d82" # latest Ubuntu 24.04
}

variable "region" {
  description = "this is Default region"
  default     = "us-east-2" 
}