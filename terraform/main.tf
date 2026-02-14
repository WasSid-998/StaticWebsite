resource "aws_s3_bucket" "static-website" {
  bucket = "var.bucketname"

}

resource "aws_s3_bucket_website_configuration" "website-config" {
    bucket = aws_s3_bucket.static-website.id
    index_document {
      suffix = "index.html"
    }
}

resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.static-website.bucket
    key = "index.html"
    source = "/c/Users/Sidan/Desktop/static-website/index.html"
    content_type = "text/html"
}