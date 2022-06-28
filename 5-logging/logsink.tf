/*
Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose.
Your use of it is subject to your agreement with Google.
*/

resource "google_logging_project_sink" "logsink" {
  project     = var.project_id
  name        = var.logsinkname
  destination = var.pubsubname
  depends_on = [
    google_pubsub_topic.pubsub-mn,
  ]
}

resource "google_logging_project_sink" "shared_logsink" {
  project     = var.project_id
  name        = var.shared_logsinkname
  destination = var.shared_pubsubname
  depends_on = [
    google_pubsub_topic.pubsub-shd,
  ]
}

resource "google_logging_organization_sink" "org-sink-main" {
  name        = var.org_aggregated_logsink_name
  org_id      = var.org_id
  destination = var.pubsubname
  filter      = var.logfilter
  depends_on = [
    google_pubsub_topic.pubsub-mn,
  ]
}

resource "google_project_iam_member" "log-writer-main" {
  project = var.project_id
  role    = var.roles
  member  = google_logging_organization_sink.org-sink-main.writer_identity
}

resource "google_logging_organization_sink" "org-sink-shared" {
  name        = var.org_aggregated_shared_logsink_name
  org_id      = var.org_id
  destination = var.shared_pubsubname
  filter      = var.shared_logfilter
  depends_on = [
    google_pubsub_topic.pubsub-shd,
  ]
}

resource "google_project_iam_member" "log-writer-shared" {
  project = var.project_id
  role    = var.roles
  member  = google_logging_organization_sink.org-sink-shared.writer_identity
}