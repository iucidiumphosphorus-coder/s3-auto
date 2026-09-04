# 1. S3バケット本体の作成
resource "aws_s3_bucket" "app_buckets" {
  for_each = var.bucket_name_suffixes
  bucket   = "corporate-projectTest-${each.value}"
}

# 2. バージョニングの有効化
resource "aws_s3_bucket_versioning" "app_buckets_versioning" {
  for_each = aws_s3_bucket.app_buckets
  bucket   = each.value.id

  versioning_configuration {
    status = "Enabled"
  }
}

# 3. パブリックアクセスの完全ブロック
resource "aws_s3_bucket_public_access_block" "app_buckets_block" {
  for_each = aws_s3_bucket.app_buckets
  bucket   = each.value.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
