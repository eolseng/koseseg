provider "google" {
  project = "koseseg"
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
        image = "eu.gcr.io/koseseg/koseseg:v19"
      }
    }
  }

  traffic {
    latest_revision = true
    percent         = 100
  }

  autogenerate_revision_name = true

}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = ["allUsers"]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.default.location
  project = google_cloud_run_service.default.project
  service = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}