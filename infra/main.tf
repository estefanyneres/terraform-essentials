provider "aws" {
  region  = "${terraform.workspace == "production" ? "us-east-1" : "us-west-2"}"
}

provider "aws" {
  alias = "west-2"
  region = "us-west-2"
  
}

terraform {
  backend "s3" {
    bucket = "descomplicando-terraform-estefany"
    dynamodb_table = "terraform-state-lock"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}