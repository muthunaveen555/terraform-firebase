output "function_urls" {
    value = google_cloudfunctions_function.myCloudFunction.*.https_trigger_url
}