resource "aws_s3_bucket" "tf_s3" {
  bucket = "aws-tf-project-bucket-01"

  tags = {
    Name        = "tf-s3-bucket"
    Environment = "Dev"
  }
}