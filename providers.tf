terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      purpose    = "SOPS POC"
      managed-by = "terraform"
      created-by = "Isaiah"
    }
  }
}

# provider "aws" {
#   region = "us-east-1"
#   alias  = "use1"
# }


