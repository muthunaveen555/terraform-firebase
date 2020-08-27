output "loadbalancer-ip" {
    value = data.google_compute_forwarding_rule.my-forwarding-rule.ip_address
}