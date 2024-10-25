resource "aws_security_group" "tf_public_sg" {
  vpc_id = aws_vpc.tf_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "tf_private_sg" {
  vpc_id = aws_vpc.tf_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"] # Allow SSH from public subnet
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "tf_frontend" { # Creating Ec2 instance as frontend
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.tf_public_sg.name]

  root_block_device {
    volume_size = var.ebs_volume_size
  }

  tags = {
    Name = "Tf-Frontend-EC2"
  }
}

resource "aws_instance" "tf_backend" { # Creating Ec2 instance as backend
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private.id
  security_groups = [aws_security_group.tf_private_sg.name]

  root_block_device {
    volume_size = var.ebs_volume_size
  }

  tags = {
    Name = "Tf-Backend-EC2"
  }
}

resource "aws_instance" "tf_bastion" { # Creating Ec2 instance as bastion-host
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.tf_public_sg.name]

  root_block_device {
    volume_size = var.ebs_volume_size
  }

  tags = {
    Name = "Tf-Bastion-Host"
  }
}
