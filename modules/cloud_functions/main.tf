resource "google_cloudfunctions_function" "myCloudFunction" {
    name                      = var.func_name
    entry_point               = var.entrypoint
    available_memory_mb       = 128
    timeout                   = 61
    runtime                   = var.runtime_env
    trigger_http              = var.http_trigger

    source_repository  {
        url = "https://source.developers.google.com/projects/iron-area-283612/repos/${var.repo_name}/${var.branch_name}${var.sourcedir}"
    }  

    labels = {
    functionality           = var.functionality
    }
}