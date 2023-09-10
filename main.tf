terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }



}
#Configure aws provider
provider "aws" {
  region = "ap-southeast-2"
}

# Create VPC
resource "aws_vpc" "test" {
    tags = {
        Name = "myaws"
    }
  cidr_block = "10.0.0.0/16"
}

#Add Subnet
resource "aws_subnet" "vpc_subnet" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Mysubnet"
  }
}
