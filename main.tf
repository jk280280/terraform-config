provider "google" {
  credentials = file("/home/jayakrishnaperam96/tf-gcp-connection-f5d7abd03058.json")
  project     = "tf-gcp-connection"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the instance an external IP address
    }
  }
}

