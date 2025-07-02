provider "aws" {
  region = var.aws_region
  // Figure out how to assume LPP role. 
}

module "blog_content_bucket" {
  source              = "./modules/blog_content_bucket"
  s3_bucket_name      = var.s3_bucket_name
  project_environment = var.project_environment
  project_name        = var.project_name
}

/*
resource "aws_iam_role" "lambda_exec" {
  name = var.lambda_role_name
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "lambda_policy" {
  name        = var.lambda_policy_name
  description = "Policy for Lambda to access S3"
  policy      = data.aws_iam_policy_document.lambda_policy.json
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.blog_content_bucket.arn}/*"]
  }
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_lambda_function" "blog_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_exec.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  filename      = var.lambda_zip_path
  source_code_hash = filebase64sha256(var.lambda_zip_path)
}

resource "aws_apigatewayv2_api" "http_api" {
  name          = var.api_name
  protocol_type = "HTTP"
}

resource "aws_cloudfront_distribution" "blog_distribution" {
  origin {
    domain_name = aws_apigatewayv2_api.http_api.api_endpoint
    origin_id   = "api-gateway-origin"
  }
  enabled             = true
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "api-gateway-origin"
    viewer_protocol_policy = "redirect-to-https"
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
*/