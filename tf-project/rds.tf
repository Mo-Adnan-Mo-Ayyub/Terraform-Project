resource "aws_db_instance" "tf_mongodb" {
  allocated_storage    = var.ebs_volume_size
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro" 
  db_name              = "mongodb"
  username             = "*****" #specify your username
  password             = "*****" #specify your password
  vpc_security_group_ids = [aws_security_group.tf_private_sg.id]
  db_subnet_group_name = aws_db_subnet_group.tf_vpc.name

  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "tf_vpc" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private.id]

  tags = {
    Name = "tf-rsd-gubnet-group"
  }
}
