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

variable "storage_buckets_lrs" ={
    name               = string
    provider           = string
    region             = string
    access             = string
    }
variable "storage_buckets_ragr" ={
    name               = string
    provider           = string
    region             = string
    access             = string
    }

