# module "firebase-project" {
#     source = "./../../../modules/firebase_project"
#     project-id = "mykubernetes-283719"
# }

module "firebase-webapp" {
    source = "./../../../modules/firebase_webapp"
    project-id = "mykubernetes-283719"
}

module "cloud-storage" {
    source = "./../../../modules/cloud_storage"
    web-app-id = module.firebase-webapp.app-id
    project-id = "mykubernetes-283719"
}