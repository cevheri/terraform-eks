variable "aws_region" {
  description = "AWS region to deploy resources in"
  default     = "eu-west-1"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block range for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "The VPC ID where the resources will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = list(string)
}

variable "sg_id" {
  description = "Security group ID"
  type        = string
}