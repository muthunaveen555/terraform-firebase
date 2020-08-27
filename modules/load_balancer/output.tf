output "loadbalancer-ip" {
    value = data.google_compute_global_address.my_address.address
}