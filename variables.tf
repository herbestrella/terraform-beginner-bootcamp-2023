variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition  = can(regex("^([a-fA-F0-9]{8}-[a-fA-F0-9]{4}-4[a-fA-F0-9]{3}-[89aAbB][a-fA-F0-9]{3}-[a-fA-F0-9]{12})$", var.user_uuid))
    error_message = "The user_uuid must be a valid UUID."
  }
}

variable "bucket_name" {
  description = "Name for the S3 bucket"
  type        = string
  validation {
    condition     = (
      length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 &&
      can(regex("^([a-z0-9][a-z0-9-.]*[a-z0-9])$", var.bucket_name))
    )
    error_message = "The bucket_name must be between 3 and 63 characters, and follow the AWS naming conventions for S3 buckets (start and end with lowercase letter or number, can contain only lowercase letters, numbers, hyphens, and periods, and not formatted as IP addresses)."
  }
}