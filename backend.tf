terraform {
  backend "gcs" {
    bucket  = "tf-gcp-config"
    prefix  = "terraform/state"
  }
}
