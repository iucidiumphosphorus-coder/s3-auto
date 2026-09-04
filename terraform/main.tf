# for_each を使ってプレフィックス付きバケットを一括管理
resource "aws_s3_bucket "app_buckets" {
  for_each = var.bucket_name_suffixes
  bucket   = "corporate-projectTest-${each.value}"
}

# バージョニングの有効化
resource "aws_s3_bucket" "app_buckets" {
  for_each = var.bucket_name_suffixes
  bucket   = each.value.id
  versioning_configuration {
    status = "Enabled"
  }
}

# パブリックアクセスの完全ブロック
resource "aws_s3_bucket" "app_buckets" {
  for_each = var.bucket_name_suffixes
  bucket                  = each.value.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
