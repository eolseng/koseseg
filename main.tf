terraform {
  backend "gcs" {
    credentials = "keyfile.json"
    bucket = "koseseg-terraform-state"
  }
}

variable "project_version" {
  type = string
  default = "latest"
}

provider "google" {
  project = "koseseg"
  region = "europe-north1"
  credentials = file("keyfile.json")
}

resource "google_cloud_run_service" "default" {

  name = "koseseg"
  location = "europe-north1"

  metadata {
    annotations = {
      "run.googleapis.com/client-name" = "terraform"
    }
  }

  template {
    spec {
      containers {
        image = "eu.gcr.io/koseseg/koseseg:${var.project_version}"
      }
    }
  }

  traffic {
    latest_revision = true
    percent = 100
  }

  autogenerate_revision_name = true

}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers"]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.default.location
  project = google_cloud_run_service.default.project
  service = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
