terraform {
  #cloud {
   # organization = "terraform-bootcamp-2023-hce"
 #   workspaces {
  #    name = "terra-house-1"
   # }
#  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
}