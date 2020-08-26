resource "google_compute_global_address" "myStaticIP" {
  name = "pe-mock-global-lb-ip"
}

data "google_compute_global_address" "my_address" {
  name = "pe-mock-global-lb-ip"
}

resource "google_storage_bucket" "static-site" {
  name          = "dream11-moc-project"
  force_destroy = true
  bucket_policy_only = true

  website {
    main_page_suffix = "index.html"
  }
  cors {
    origin          = ["https://storage.googleapis.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}


resource "google_compute_backend_bucket" "dream11-mock-backend" {
  name        = var.backend_bucket_name
  description = "Contains beautiful images"
  bucket_name = google_storage_bucket.static-site.name
  enable_cdn  = var.cdn_option
}

#Creating Forwarding rules
#URL Mapping
resource "google_compute_url_map" "urlmap" {
    name        = "urlmap"
    description = "a description"

  default_service = google_compute_backend_bucket.dream11-mock-backend.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "mypath"
  }

  path_matcher {
    name            = "mypath"
    default_service = google_compute_backend_bucket.dream11-mock-backend.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_bucket.dream11-mock-backend.id
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
  ip_address            = data.google_compute_global_address.my_address.address
}