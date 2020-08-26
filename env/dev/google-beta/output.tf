output "app-id" {
    value = module.firebase-webapp.app-id
    description = "app id of the web app"
}

output "google-project-id" {
    description = "project id of the google project we created"
    value = module.google-project.google-project-id
}