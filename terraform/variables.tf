variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-2"
}

variable "vpc_id" {
  description = "The ID of the VPC where the resources will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be deployed"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance"
  default     = "ami-08e9f0e999f3c25a3"  # Ubuntu 20.04 LTS
}

variable "key_name" {
  description = "The name of the SSH key pair to use for the EC2 instance"
  type        = string
}
