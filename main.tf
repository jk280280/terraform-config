# main.tf
provider "google" {
  credentials = "2d4bb0e3165672956155143594bacfc52c597322"
  project     = "tf-gcp-connection"
  region      = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "test-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
