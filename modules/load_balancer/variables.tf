variable "bucket_name"{
    default="dream11-moc-project"
}
variable "backend_bucket_name"{
    default="dream11-moc-project"
}
variable "cdn_option"{
    type=bool
    default=true
}
variable "target_proxy_name"{
    default="pe-mock-http-proxy"
}
variable "forwarding_rule_name"{
    default="pe-mock-forwarding-rule"
}
