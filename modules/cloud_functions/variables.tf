variable "number_of_functions" {
  type = number
}
variable "func_name" {
  default = "function-blah-blah"
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
  default     = ["function-1-nava", "function-2-nava"]
  description = "(optional) describe your variable"
}
variable "url_branch" {
  type        = list(string)
  default     = ["function-1", "function-2"]
  description = "(optional) describe your variable"
}