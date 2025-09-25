resource "aws_kms_key" "vault" {
  description             = "KMS key for ${var.kms_key_alias}"
  deletion_window_in_days = 7
  tags = {
    env = var.env
  }
}

resource "aws_kms_alias" "vault_alias" {
  name          = "alias/${var.kms_key_alias}"
  target_key_id = aws_kms_key.vault.id
}