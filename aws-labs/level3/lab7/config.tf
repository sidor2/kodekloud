terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "aws" {
  # Configuration options
    region = "us-east-1"  # Adjust as needed
    profile = "kodek"
}