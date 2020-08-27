resource "google_compute_global_address" "myStaticIP" {
  name = var.elastic-ip-name
}

data "google_compute_global_address" "my_address" {
  name = var.elastic-ip-name
}

resource "google_storage_bucket" "static-site" {
  name          = var.static-site-bucket-name
  force_destroy = true
  #   bucket_policy_only = true

  website {
    main_page_suffix = "index.html"
  }
  cors {
    origin          = ["https://storage.googleapis.com"]
      method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
      response_header = ["*"]
      max_age_seconds = 3600
    }
   versioning {
    enabled = "true"
  }
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.static-site.name
  role   = var.user-role
  entity = var.user-entity
}


resource "google_compute_backend_bucket" "dream11-mock-backend" {
  name        = var.backend_bucket_name
  bucket_name = google_storage_bucket.static-site.name
  enable_cdn  = var.cdn_option
}

#Creating Forwarding rules
#URL Mapping
resource "google_compute_url_map" "urlmap" {
  name        = var.urlmap-name
  description = "a description"

  default_service = google_compute_backend_bucket.dream11-mock-backend.id

  host_rule {
    hosts        = ["*"]
    path_matcher = var.pathname
  }

  path_matcher {
    name            = var.pathname
    default_service = google_compute_backend_bucket.dream11-mock-backend.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_bucket.dream11-mock-backend.id
    }
  }
}

#HTTP Configuring
resource "google_compute_target_http_proxy" "targetHTTPProxy" {
  name    = var.target_proxy_name
  url_map = google_compute_url_map.urlmap.id
}

resource "google_compute_global_forwarding_rule" "forwardingHTTPRule" {
  name                  = var.forwarding_rule_name
  target                = google_compute_target_http_proxy.targetHTTPProxy.id
  port_range            = var.port-range
  load_balancing_scheme = var.load-balancing-scheme
  ip_address            = data.google_compute_global_address.my_address.address
}