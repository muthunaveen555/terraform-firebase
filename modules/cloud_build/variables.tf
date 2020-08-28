variable "repo_name" {
  type        = string
  default     = "pe-mock-project-cf"
  description = "cloud source repository name"
}

variable "branch_list" {
  type        = list(string)
  default     = ["function-signup","function-list-teams","function-list-leagues","function-list-players","function-user-team-selection","function-scorecard","function-prize-money","function-wallet","function-user-match-history"]
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