variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition  = can(regex("^([a-fA-F0-9]{8}-[a-fA-F0-9]{4}-4[a-fA-F0-9]{3}-[89aAbB][a-fA-F0-9]{3}-[a-fA-F0-9]{12})$", var.user_uuid))
    error_message = "The user_uuid must be a valid UUID."
  }
}