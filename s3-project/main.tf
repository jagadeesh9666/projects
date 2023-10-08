resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.jas3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.jas3.id
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.jas3.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = aws_s3_bucket.jas3.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "s3png" {
  bucket = aws_s3_bucket.jas3.id
  key    = "s3.png"
  source = "./Images/s3.png"
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "s4png" {
  bucket = aws_s3_bucket.jas3.id
  key    = "s4.png"
  source = "./Images/s4.png"
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "s5png" {
  bucket = aws_s3_bucket.jas3.id
  key    = "s5.png"
  source = "./Images/s5.png"
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.jas3.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.example]
}