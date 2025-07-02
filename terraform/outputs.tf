output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.blog_content_bucket.arn
}

/*
output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.blog_lambda.arn
}

output "api_gateway_endpoint" {
  description = "API Gateway HTTP API endpoint"
  value       = aws_apigatewayv2_api.http_api.api_endpoint
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.blog_distribution.domain_name
}
*/