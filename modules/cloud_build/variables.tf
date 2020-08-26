variable "branch_name"{
    type = string
    default="function-1"
}

variable "repo_name"{
    type = string
    default="pe-mock-project-cf"
}

variable "branch_list" {
    type = list(string)
    default = ["function-1","function-2"]
    description = "(optional) describe your variable"
}

variable "number_of_triggers" {
    type = number
    description = "(optional) describe your variable"
}