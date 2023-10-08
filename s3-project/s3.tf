resource "aws_s3_bucket" "jas3" {
  bucket = "j2hbucket"

  tags = {
    Name = var.bucket-name
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.jas3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}



