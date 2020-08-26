module "cloud-build" {
    number_of_triggers = length(branch_list)
    source = "./../../../modules/cloud_build"
}

# module "cloud-build" {
#     source = "./../../../modules/cloud_build"
#     var.branch_name = "master"
#     var.repo_name = "pe-mock-project-gcs"
# }

module "cloud-function" {
    source = "./../../../modules/cloud_functions"
}

module "load_balancer" {
    source = "./../../../modules/load_balancer"
}