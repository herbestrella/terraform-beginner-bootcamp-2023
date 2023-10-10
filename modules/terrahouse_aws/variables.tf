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

variable "index_html_filepath" {
  description = "The file path for index.html"
  type        = string

  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "The provided p[ath for index.html does not exist."
  }
}

variable "error_html_filepath" {
  description = "The file path for error.html"
  type        = string

  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The provided p[ath for error.html does not exist."
  }
}

variable "content_version" {
  description = "Content version which must be a positive integer starting at 1"
  type        = number

  validation {
    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "The content_version must be a positive integer starting at 1."
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type        = string
}
