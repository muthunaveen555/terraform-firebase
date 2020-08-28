variable "branch_name" {
  default = "function-1"
}
variable "repo_name" {
  default = "pe-mock-project-cf"
}
variable "func_name" {
  default = "function-1"
}
variable "number_of_functions" {
  type    = number
  default = 1
}

variable "yamlfile" {
  type        = string
  description = "yaml file name"
  default     = "cloudbuild.yaml"
}

variable "branch_list" {
  type        = list(string)
  default     = ["function-signup","function-list-teams","function-list-leagues","function-list-players","function-user-team-selection","function-scorecard","function-prize-money","function-wallet","function-user-match-history"]
  description = "list of cloud source repository branches we need to set the trigger"
}
#List of Cloud Function names
variable "function_list" {
  type        = list(string)
  default     = ["function-signup","function-list-teams","function-list-leagues","function-list-players","function-user-team-selection","function-scorecard","function-prize-money","function-wallet","function-user-match-history"]
  description = "list of functions"
}
variable "url_branch" {
  type        = list(string)
  default     = ["function-signup","function-list-teams","function-list-leagues","function-list-players","function-user-team-selection","function-scorecard","function-prize-money","function-wallet","function-user-match-history"]
  description = "list of branch urls"
}
variable "entrypoint" {
  default = "hello_world"
}
variable "runtime_env" {
  default = "python37"
}
variable "http_trigger" {
  type    = bool
  default = true
}

variable "bucket_name" {
  default = "firebase-webapp"
}
variable "backend_bucket_name" {
  default = "firebase-webapp"
}
variable "cdn_option" {
  type    = bool
  default = false
}
variable "sourcedir" {
  default = "./"
}
variable "target_proxy_name" {
  default = "pe-mock-http-proxy"
}
variable "forwarding_rule_name" {
  default = "pe-mock-forwarding-rule"
}

variable "bucket-branch-name" {
  type = string
  description = "branch name"
  default = "master"
}

variable "bucket-repo-name" {
  type = string
  description = "branch name"
  default = "pe-mock-project-gcs"
}