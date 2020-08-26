variable "bucket_name"{
    default="firebase-webapp"
}
variable "backend_bucket_name"{
    default="firebase-webapp"
}
variable "cdn_option"{
    type=bool
    default=false
}
variable "target_proxy_name"{
    default="pe-mock-http-proxy"
}
variable "forwarding_rule_name"{
    default="pe-mock-forwarding-rule"
}
