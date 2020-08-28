#cloud build module
module "cloud-build" {
  number_of_triggers = length(var.branch_list)
  yamlfile = "cloudbuild.yaml"
  source             = "./../../../modules/cloud_build"
}

#cloud function module
module "cloud-function" {
  number_of_functions = length(var.function_list)
  source              = "./../../../modules/cloud_functions"
}

#load balancer module
module "load_balancer" {
  source = "./../../../modules/load_balancer"
}