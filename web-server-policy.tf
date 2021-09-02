data "aws_iam_policy_document" "web_server" {
  statement {
    sid    = "GetS3Stuff"
    effect = "Allow"
    actions = [
      "s3:List*",
      "s3:Get*"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "web_server_cloudwatch" {
  statement {
    sid    = "CreateLogGroup"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
      
    ]
    resources = ["arn:aws:logs:us-east-2:733041935482:*"]
  }
}





