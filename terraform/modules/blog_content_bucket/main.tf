variable "s3_bucket_name" {
  description = "Name of the S3 bucket for blog content"
  type        = string
}

variable "project_environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging purposes"
  type        = string
}


resource "aws_s3_bucket" "blog_content" {
  bucket = var.s3_bucket_name

  # Tags
  tags = {
    Environment = var.project_environment
    Project     = var.project_name
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.blog_content.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "arn" {
  value = aws_s3_bucket.blog_content.arn
}