terraform {
  backend "s3" {
    key = "TF-PROJECT/terraform.tfstate"
    bucket = "aws-tf-project-bucket-01"
    region = "us-east-2" #Error: Variables not allowed
  }
}