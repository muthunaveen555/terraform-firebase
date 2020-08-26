resource "google_cloudfunctions_function" "myCloudFunction" {
  count        = var.number_of_functions
  name         = var.function_list[count.index]
  entry_point  = var.entrypoint
  runtime      = var.runtime_env
  trigger_http = var.http_trigger

  source_repository {
    url = "https://source.developers.google.com/projects/iron-area-283612/repos/pe-mock-project-cf/moveable-aliases/${var.url_branch[count.index]}"
  }

}