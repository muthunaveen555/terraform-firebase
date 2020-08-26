terraform {
  backend "gcs" {
    bucket = "dream11-terraform-state-backend"
    prefix = "terraform/state"
  }
}