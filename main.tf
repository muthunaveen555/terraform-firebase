resource "google_project" "default" {
  provider = google-beta

  project_id = "terraform-firebase"
  name       = "terraform-firebase"
}

resource "google_firebase_project" "default" {
  provider = google-beta
  project  = google_project.default.project_id
}

resource "google_firebase_web_app" "basic" {
  provider     = google-beta
  project      = google_project.default.project_id
  display_name = "firebase_app"

  depends_on = [google_firebase_project.default]
}

data "google_firebase_web_app_config" "basic" {
  provider   = google-beta
  web_app_id = google_firebase_web_app.basic.app_id
}

resource "google_storage_bucket" "default" {
  provider = google-beta
  name     = "fb-webapp-terraform"
}

resource "google_storage_bucket_object" "default" {
  provider = google-beta
  bucket   = google_storage_bucket.default.name
  name     = "firebase-config.json"

  content = jsonencode({
    appId             = google_firebase_web_app.basic.app_id
    apiKey            = data.google_firebase_web_app_config.basic.api_key
    authDomain        = data.google_firebase_web_app_config.basic.auth_domain
    databaseURL       = lookup(data.google_firebase_web_app_config.basic, "database_url", "")
    storageBucket     = lookup(data.google_firebase_web_app_config.basic, "storage_bucket", "")
    messagingSenderId = lookup(data.google_firebase_web_app_config.basic, "messaging_sender_id", "")
    measurementId     = lookup(data.google_firebase_web_app_config.basic, "measurement_id", "")
  })
}

resource "google_cloudbuild_trigger" "myTrigger" {
  trigger_template {
    branch_name = var.branch_name
    repo_name   = var.repo_name
  }
  filename = "cloudbuild.yaml"
}

resource "google_cloudfunctions_function" "myCloudFunction" {
  name                = var.func_name
  entry_point         = var.entrypoint
  available_memory_mb = 128
  timeout             = 61
  runtime             = var.runtime_env
  trigger_http        = var.http_trigger

  source_repository {
    url = "https://source.developers.google.com/projects/iron-area-283612/repos/${var.repo_name}/${var.branch_name}${var.sourcedir}"
  }

  labels = {
    functionality = var.functionality
  }
}

#Configuring the Global Load Balancer
#Reserving the Static IP address
resource "google_compute_global_address" "default" {
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
    name            = "mysite"
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
  ip_address            = var.static_ip
}
