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

# AWS MSK Cluster(Managed Streaming for Apache Kafka)
resource "aws_msk_cluster" "msk" {
  cluster_name           = "my-msk-cluster"
  kafka_version          = "2.2.1"
  number_of_broker_nodes = 3
  broker_node_group_info {
    client_subnets = var.subnet_ids
    instance_type  = "kafka.m5.large"
    security_groups = [var.sg_id]
  }
  encryption_info {
    encryption_in_transit {
      client_broker = "TLS_PLAINTEXT"
      in_cluster    = true
    }
  }

  tags = {
    Name = "my-msk-cluster"
  }
}