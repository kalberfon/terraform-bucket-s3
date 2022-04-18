terraform {
  required_version = "1.1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}
provider "aws" {
  region = "sa-east-1"
  profile = "terraform-dev"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket_prefix = "my-tf-test-bucket-"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "test_bucket_acl" {
  bucket = aws_s3_bucket.test_bucket.id
  acl    = "private"
}
