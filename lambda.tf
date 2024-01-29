data "aws_ecr_repository" "tech-challenge-ecr" {
  name = "auth-service"
}

resource "aws_lambda_function" "auth-service-lambda" {
  function_name = "auth-service-${var.env_name}"
  timeout       = 5 # seconds
  image_uri     = "${data.aws_ecr_repository.tech-challenge-ecr.repository_url}:${var.env_name}"
  package_type  = "Image"

  role = aws_iam_role.auth-service-role.arn

  environment {
    variables = {
      ENVIRONMENT = var.env_name
    }
  }
}

resource "aws_iam_role" "auth-service-role" {
  name = "auth-service-${var.env_name}"

  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}