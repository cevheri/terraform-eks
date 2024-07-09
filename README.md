# Terraform Amazon EKS Cluster

## Description
This project creates an EKS cluster with a VPC, RDS, MSK, and AWS Load Balancer Controller.

## Prerequisites
* [AWS account](https://signin.aws.amazon.com/signup?request_type=register)
* [AWS profile configured](https://aws.amazon.com/cli/)
* [Terraform](https://www.terraform.io/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/)

---

## Project Structure
Project structure is as follows:
* [main.tf](main.tf) - Main Terraform configuration file
* [variables.tf](variables.tf) - Variables file
* [outputs.tf](outputs.tf) - Outputs file

### Modules:
* [vpc](modules/vpc) - VPC module (Virtual Private Cloud)
* [eks](modules/eks) - EKS module (Elastic Kubernetes Service)
* [rds](modules/rds) - RDS module (Amazon Managed PostgreSQL)
* [msk](modules/msk) - MSK module (AWS Managed Kafka)
* [alb](modules/lb) - AWS Load Balancer Controller module
* [s3](modules/s3) - S3 module (Simple Storage Service)
* [security_group](modules/security-groups) - Security Group module

---

## How to Run
* Update main.tf, variables.tf files (do not forget "sasl_password" in main.tf)
* aws configure
* init
```bash
terraform init
```

* plan
```bash
terraform plan
```

* apply

```bash
terraform apply
```

---

## References
* [Provision an EKS cluster (AWS)](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks)
* [Resource: aws_rds_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster.html)
* [Resource: aws_msk_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/msk_cluster)
* [Deploy an high available Kubernetes (k8s) cluster on Amazon AWS](https://github.com/garutilorenzo/k8s-aws-terraform-cluster)