provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      Owner       = "Him"
      ManagedBy   = "Terraform"
      Course      = "AWS-SAA-C03"
    }
  }
}