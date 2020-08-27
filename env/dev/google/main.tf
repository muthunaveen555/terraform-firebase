module "cloud-build" {
  number_of_triggers = length(var.branch_list)
  source             = "./../../../modules/cloud_build"
}

# module "cloud-build-bucket" {
#   source           = "./../../../modules/cloud_build"
#   var.branch_name  = "master"
#   var.repo_name    = "pe-mock-project-gcs"
# }


module "cloud-function" {
  number_of_functions = length(var.function_list)
  source              = "./../../../modules/cloud_functions"
}

module "load_balancer" {
  source = "./../../../modules/load_balancer"
}