resource "aws_kms_key" "vault" {
  description             = "KMS key for ${var.kms_key_alias}"
  deletion_window_in_days = 7
  tags = {
    env = var.environment.name
  }
}

resource "aws_kms_alias" "vault_alias" {
  name          = "alias/${var.kms_key_alias}"
  target_key_id = aws_kms_key.vault.id
}

resource "aws_s3_bucket" "lrs" {
  provider = var.storage_buckets_lrs.provider
  region   = var.storage_buckets_lrs.region
  bucket   = var.storage_buckets_lrs.name

  acl = "var.storage_buckets_lrs.access "

  tags = {
    env = var.environment.name
  }
}

resource "aws_s3_bucket_public_access_block" "lrs" {
  provider = storage_buckets_lrs.provider
  bucket   = aws_s3_bucket.lrs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "ragr" {
  provider = var.storage_buckets_ragr.provider
  region   = var.storage_buckets_ragr.region
  bucket   = var.storage_buckets_ragr.name

  acl = "var.storage_buckets_ragr.access "

  tags = {
    env = var.environment.name
  }
}

resource "aws_s3_bucket_public_access_block" "ragr" {
  provider = storage_buckets_ragr.provider
  bucket   = aws_s3_bucket.ragr.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}