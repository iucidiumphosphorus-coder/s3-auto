terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "corporate-s3-terraform-state-950177941522"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "corporate-s3-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Environment = "Production"
      Project     = "CorporateProjectTest"
    }
  }
}
