provider "aws" {
  region = "ap-southeast-2"
  assume_role {
    role_arn = "arn:aws:iam::${local.workspace["aws_account_id"]}:role/${local.workspace["aws_role"]}"
  }
}