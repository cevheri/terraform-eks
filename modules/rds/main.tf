terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_rds_instance" "mydb" {
  allocated_storage    = 20
  engine               = "postgres"
  storage_type         = "gp2"
  engine_version       = "11.9"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "myuser"
  password             = "mypassword"
  parameter_group_name = "default.postgres11"
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.db_sg_id]
}

output "db_instance_endpoint" {
  value = aws_rds_instance.mydb.endpoint
}