terraform {
  backend "s3" {
    bucket = "terraform-backend-am"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "state-lock"
  }
}
