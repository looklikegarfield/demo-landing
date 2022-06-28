/*
Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose.
Your use of it is subject to your agreement with Google.
*/

resource "google_pubsub_topic" "pubsub-mn" {
  name                       = var.pubsubtopic_name
  project                    = var.project_id
  message_retention_duration = var.retention
  message_storage_policy {
    allowed_persistence_regions = [
      var.region,
    ]
  }
}

resource "google_pubsub_topic" "pubsub-shd" {
  name                       = var.shared_pubsubtopic_name
  project                    = var.project_id
  message_retention_duration = var.retention
  message_storage_policy {
    allowed_persistence_regions = [
      var.region,
    ]
  }
}

#--------------------------------#
# Service account IAM membership #
#--------------------------------#
resource "google_pubsub_topic_iam_member" "pubsub_sink_member-mn" {
  project = var.project_id
  topic   = var.pubsubtopic_name
  role    = "roles/pubsub.publisher"
  member  = google_logging_project_sink.logsink.writer_identity
  depends_on = [
    google_logging_project_sink.logsink
  ]
}

resource "google_pubsub_topic_iam_member" "pubsub_sink_member-shd" {
  project = var.project_id
  topic   = var.shared_pubsubtopic_name
  role    = "roles/pubsub.publisher"
  member  = google_logging_project_sink.shared_logsink.writer_identity
  depends_on = [
    google_logging_project_sink.shared_logsink
  ]
}


