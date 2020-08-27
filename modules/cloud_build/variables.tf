variable "repo_name" {
  type        = string
  default     = "pe-mock-project-cf"
  description = "cloud source repository name"
}

variable "branch_list" {
  type        = list(string)
  default     = ["function-1", "function-2"]
  description = "list of cloud source repository branches we need to set the trigger"
}

variable "number_of_triggers" {
  type        = number
  description = "number of triggers we need"
}

variable "yamlfile" {
  type        = string
  description = "yaml file name"
  default     = "cloudbuild.yaml"
}

variable "branch-name" {
  type = string
  description = "branch name"
  default = ""
}