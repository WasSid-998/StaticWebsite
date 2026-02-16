resource "aws_s3_bucket" "was-sid-static-1998-unique-website-build-2026" {
  bucket = var.bucketname

}

resource "aws_s3_bucket_website_configuration" "website-config" {
    bucket = aws_s3_bucket.was-sid-static-1998-unique-website-build-2026.id
    index_document {
      suffix = "index.html"
    }
}

resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.was-sid-static-1998-unique-website-build-2026.bucket
    key = "index.html"
    source = "/app/website/index.html"
    content_type = "text/html"
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.was-sid-static-1998-unique-website-build-2026.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${aws_s3_bucket.was-sid-static-1998-unique-website-build-2026.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.was-sid-static-1998-unique-website-build-2026.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}