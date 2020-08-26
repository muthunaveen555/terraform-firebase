variable "branch_name"{
    default="function-1"
}
variable "repo_name"{
    default="pe-mock-project-cf"
}
variable "func_name"{
    default="function-terraform"
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
    default="dream11-firebase"
}
variable "backend_bucket_name"{
    default="dream11-firebase"
}
variable "cdn_option"{
    type=bool
    default=false
}
variable "sourcedir"{
    default="./"
}

