output "function_urls" {
  value = google_cloudfunctions_function.myCloudFunction.*.https_trigger_url
}

output "function_names" {
  value = google_cloudfunctions_function.myCloudFunction.*.id
}