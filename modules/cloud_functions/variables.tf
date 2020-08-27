variable "number_of_functions" {
  type        = number
  description = "number of cloud functions we need to create"
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
variable "function_list" {
  type        = list(string)
  default     = ["function-signup","function-list-teams","function-list-leagues","function-list-players","function-user-team-selection","function-scorecard","function-prize-money","function-wallet"]
  description = "list of functions"
}
variable "url_branch" {
  type        = list(string)
  default     = ["function-signup","function-list-teams","function-list-leagues","function-list-players","function-user-team-selection","function-scorecard","function-prize-money","function-wallet"]
  description = "list of branch urls"
}