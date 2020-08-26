module "cloud-build" {
    source = "./../../../modules/cloud_build"
}

module "cloud-function" {
    source = "./../../../modules/cloud_functions"
}

module "load_balancer" {
    source = "./../../../modules/load_balancer"
}