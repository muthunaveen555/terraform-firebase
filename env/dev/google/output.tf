output "function_names" {
  value = module.cloud-function.function_names
}

output "function_urls" {
  value = module.cloud-function.function_urls
}

output "loadbalancer-ip" {
    value = module.load_balancer.loadbalancer-ip
}