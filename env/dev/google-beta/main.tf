module "google-project" {
    source = "./../../../modules/google_project"
}

module "firebase-project" {
    source = "./../../../modules/firebase_project"
    project-id = module.google-project.google-project-id
}

module "firebase-webapp" {
    source = "./../../../modules/firebase_webapp"
    depends_on = [module.firebase-project]
    project-id = module.google-project.google-project-id
}

module "cloud-storage" {
    source = "./../../../modules/cloud_storage"
    web-app-id = module.firebase-webapp.app-id
}