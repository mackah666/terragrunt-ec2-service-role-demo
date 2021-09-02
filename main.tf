provider "aws" {
  region  = var.aws_region
  profile = var.aws_cli_profile
}

terraform {
  backend "s3" {}
}

module "web_server" {
  source = "git@github.com:mackah666/terragrunt-test-modules.git//iam-ec2-role?ref=v1.3.0"

  ec2_iam_role_name  = "svc-web-server-role"
  policy_description = "IAM ec2 instance profile for the web servers."
  assume_role_policy = file("assumption-policy.json")
  policy             = data.aws_iam_policy_document.web_server.json
}


