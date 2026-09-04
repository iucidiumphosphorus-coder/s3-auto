variable "bucket_name_suffixes" {
  type        = set(string)
  description = "corporate-projectTest- に続くバケット名サフィックスのリスト（複数作成可能）"
  
  validation {
    condition     = length(var.bucket_name_suffixes) > 0
    error_message = "少なくとも1つ以上のバケット名サフィックスを指定してください。"
  }
}
