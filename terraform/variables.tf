variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for blog content"
  type        = string
}

variable "project_environment" {
  description = "Runtime and organizational environment"
  type        = string
}

variable "project_name" {
  description = "Project name, used for AWS resource naming and tagging"
  type        = string
  default     = "personal-site-aws"
}

/*

variable "lambda_role_name" {
  description = "Name of the IAM role for Lambda"
  type        = string
}

variable "lambda_policy_name" {
  description = "Name of the IAM policy for Lambda"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
  default     = "index.handler"
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "nodejs18.x"
}

variable "lambda_zip_path" {
  description = "Path to the Lambda deployment package"
  type        = string
}

variable "api_name" {
  description = "Name of the API Gateway HTTP API"
  type        = string
}
*/
