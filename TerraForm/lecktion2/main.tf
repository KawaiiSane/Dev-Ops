terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" ## Specify the version of the AWS provider you want to use
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC (Virtual Private Cloud) in AWS as a Resource
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# resource "aws_ec2_host" "name" {
#    vpc_id = aws_vpc.example.id 
# }