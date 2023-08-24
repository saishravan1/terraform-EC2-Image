variable "aws_region" {
  default     = "us-east-2"
  type        = string
  description = "aws region for provisioner"
}

variable "aws_profile" {
  default     = "default"
  type        = string
  description = "aws command profile for terraform"
}

variable "aws_ami" {
  default     = "ami-0ccabb5f82d4c9af5"
  type        = string
  description = " amazon machine image"
}
variable "aws_instance_type" {
  default     = "t2.micro"
  type        = string
  description = " ec2 instance type"
}

variable "aws_instance_key" {
  type        = string
  description = "instance key"
}

variable "backend_bucket" {
    type = string
    description = "state file S3 bucket"
}

