provider "google" {
    project     = "tf-gcp-connection"
  region      = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "my-subnetwork"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.vpc_network.id
  region        = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vm"
  machine_type  = "e2-medium"
  zone         = "us-central1-a"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10-buster-v20210817"
    }
  }
  
  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnetwork.id

    access_config {
      // Assign a public IP
    }
  }
  
  tags = ["web"]
}

resource "google_storage_bucket" "bucket" {
  name          = "terraform-bucket-unique-name"
  location      = "US"
}
