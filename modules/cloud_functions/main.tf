resource "google_cloudfunctions_function" "myCloudFunction" {
    name                      = var.func_name
    entry_point               = var.entrypoint
    available_memory_mb       = 128
    timeout                   = 61
    runtime                   = var.runtime_env
    trigger_http              = var.http_trigger

    source_repository  {
        url = "https://source.developers.google.com/projects/iron-area-283612/repos/pe-mock-project-cf/moveable-aliases/function-1/paths/iron-area-283612/pe-mock-project-cf/function-1//"
    }

    labels = {
    functionality           = var.functionality
    }
}