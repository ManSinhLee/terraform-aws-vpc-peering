terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.virginia
  profile = var.profile
  alias   = "virginia"
}

provider "aws" {
  region  = var.oregon
  profile = var.profile
  alias   = "oregon"
}