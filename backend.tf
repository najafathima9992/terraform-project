terraform {
  backend "s3" {
    bucket         = "your-tf-state-bucket-12"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
