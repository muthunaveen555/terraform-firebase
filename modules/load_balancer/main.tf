resource "google_compute_global_address" "myStaticIP" {
  name = "pe-mock-global-lb-ip"
}

resource "google_compute_backend_bucket" "pe-mock-backend" {
  name        = var.backend_bucket_name
  description = "Contains beautiful images"
  bucket_name = var.bucket_name
  enable_cdn  = var.cdn_option
}

#Creating Forwarding rules
#URL Mapping
resource "google_compute_url_map" "urlmap" {
    name        = "urlmap"
    description = "a description"

  default_service = google_compute_backend_bucket.pe-mock-backend.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "myPath"
  }

  path_matcher {
    name            = "myPath"
    default_service = google_compute_backend_bucket.pe-mock-backend.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_bucket.pe-mock-backend.id
    }
  }
}

#HTTP Configuring
resource "google_compute_target_http_proxy" "targetHTTPProxy" {
  name        = var.target_proxy_name
  description = "HTTP Target Proxy"
  url_map     = google_compute_url_map.urlmap.id
}

resource "google_compute_global_forwarding_rule" "forwardingHTTPRule" {
  name                  = var.forwarding_rule_name
  target                = google_compute_target_http_proxy.targetHTTPProxy.id
  port_range            = "80"
  load_balancing_scheme = "EXTERNAL"
  ip_address            = google_compute_global_address.myStaticIP.id
}