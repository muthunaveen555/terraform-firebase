variable "backend_bucket_name" {
  default = "backend-bucket-mock"
}
variable "cdn_option" {
  type    = bool
  default = true
}
variable "target_proxy_name" {
  default = "pe-mock-http-proxy"
}
variable "forwarding_rule_name" {
  default = "pe-mock-forwarding-rule"
}

variable "elastic-ip-name" {
  type        = string
  description = "name of the external ip created"
  default     = "pe-mock-global-lb-ip"
}
variable "static-site-bucket-name" {
  type        = string
  description = "bucket name where the website is getting hosted"
  default     = "dream11-website-bucket"
}

variable "user-role" {
  type        = string
  description = "role for the bucket access control"
  default     = "READER"
}

variable "user-entity" {
  type        = string
  description = "entity for the bucket access control"
  default     = "allUsers"
}

variable "urlmap-name" {
  type        = string
  description = "name of the url mapping resource"
  default     = "urlmap"
}

variable "pathname" {
  type        = string
  description = "path name"
  default     = "mypath"
}

variable "load-balancing-scheme" {
  type        = string
  description = "scheme for load balancing"
  default     = "EXTERNAL"
}

variable "port-range" {
  type        = string
  description = "port range for load balancing"
  default     = "80"
}