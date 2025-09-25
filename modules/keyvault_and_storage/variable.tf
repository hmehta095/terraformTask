variable "env" {
  description = "Environment tagging and validating env"
  type        = string
  validation {
    condition     = contains(["dev", "qa", "stg", "prd"], var.environment)
    error_message = "The env variable must be one of dev, qa, stg, prd"
  }
}

variable "storage_buckets" {
  description = "List of storage bucket configs with properties"
  type = list(object({
    name              = string
    region            = string
    public_access     = bool
  }))
}
