variable "environment" {
  description = "Environment tagging and validating env"
  type        = string
  validation {
    condition     = contains(["dev", "qa", "stg", "prd"], var.environment.name)
    error_message = "The env variable must be one of dev, qa, stg, prd"
  }
}

variable "kms_key_alias" {
  description = "Alias for the KMS key (Key Vault equivalent)"
  type        = string
}

variable "storage_buckets" {
  description = "List of storage bucket configs with properties"
  type = list(object({
    name              = string
    region            = string
    public_access     = bool
  }))
}
