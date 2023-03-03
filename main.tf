provider "google" {
  region = "us-west1"
}

resource "google_project" "proji" {
  name       = "My Project"
  project_id = "your-project-id"
  org_id     = "1234567"
}

resource "google_app_engine_application" "publicDataStore" {
  project       = google_project.proji.project_id
  location_id   = "us-central"
  database_type = "CLOUD_DATASTORE"
}

resource "google_app_engine_application" "publicFireStore" {
  project       = google_project.proji.project_id
  location_id   = "us-central"
  database_type = "CLOUD_FIRESTORE"
}

resource "google_app_engine_application" "publicCompatStore" {
  project       = google_project.proji.project_id
  location_id   = "us-central"
  database_type = "CLOUD_DATASTORE_COMPATIBILITY"
}

resource "google_app_engine_firewall_rule" "publicRuleData" {
  project      = google_app_engine_application.publicDataStore.project
  priority     = 1000
  action       = "ALLOW"
  source_range = "*"
}

resource "google_app_engine_firewall_rule" "publicRuleFire" {
  project      = google_app_engine_application.publicFireStore.project
  priority     = 1000
  action       = "ALLOW"
  source_range = "*"
}

resource "google_app_engine_firewall_rule" "publicRuleCompat" {
  project      = google_app_engine_application.publicCompatStore.project
  priority     = 1000
  action       = "ALLOW"
  source_range = "*"
}

