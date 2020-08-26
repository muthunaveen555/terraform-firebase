variable "project-id" {
  type        = string
  description = "google project id"
  default     = ""
}

variable "bucket_name" {
  type        = string
  description = "bucket name"
  default     = "dream11-terraform-state-backend"
}