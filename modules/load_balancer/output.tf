output "loadbalancer-ip" {
    value = data.google_compute_global_address.my_address.address
}

output "website-bucket-url" {
    value = google_storage_bucket.static-site.url
}