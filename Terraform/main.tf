terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }  
  }
  required_version = ">= 0.14.9"

#copy *.tfstate to aws s3  
  backend "s3" {
    bucket = "ivan-lovkin-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "eu-central-1"
 }    
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_instance" "develop" {
  ami                    = "ami-02584c1c9d05efa69" # ubuntu 20.04
  instance_type          = "t2.micro"
  key_name               = "docker_key"
  vpc_security_group_ids = [aws_security_group.dev_server.id]

  tags = {
    Name    = "Development server"
    Owner   = "Ivan Lovkin"
    Project = "Final task"
  }
}

resource "aws_security_group" "dev_server" {
  name        = "Dev server security group"
  description = "This is develop server security group"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev_server_vps"
  }
}

resource "aws_instance" "product" {
  ami                    = "ami-02584c1c9d05efa69" # ubuntu 20.04
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.prod_server.id]
  key_name               = "docker_key"	

  tags = {
    Name    = "Production server"
    Owner   = "Ivan Lovkin"
    Project = "Final task"
  }
}

resource "aws_security_group" "prod_server" {
  name        = "Product server security group"
  description = "This is product server security group"
  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "product_server_vps"
  }
}
