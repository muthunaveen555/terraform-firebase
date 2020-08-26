variable "branch_name"{
    default="function-1"
}
variable "repo_name"{
    default="pe-mock-project-cf"
}
variable "func_name"{
    default="function-1"
}

variable "branch_list" {
    type = list(string)
    default = ["function-1","function-2"]
    description = "(optional) describe your variable"
}
variable "entrypoint"{
    default="hello_world"
}
variable "runtime_env"{
    default="python37"
}
variable "http_trigger"{
    type = bool
    default=true
}
variable "functionality"{
    default="Defines the fucntionality of Cloud function"
}
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
variable "sourcedir"{
    default="./"
}
variable "target_proxy_name"{
    default="pe-mock-http-proxy"
}
variable "forwarding_rule_name"{
    default="pe-mock-forwarding-rule"
}
