output "logsink" {
  value       = google_logging_project_sink.logsink.id
  description = "Project Log Sink Name"
}

output "shared_logsink" {
  value       = google_logging_project_sink.shared_logsink.id
  description = "Project Shared Log Sink Name"
}

output "org-sink-main" {
  value       = google_logging_organization_sink.org-sink-main.id
  description = "Org Log Sink Name"
}

output "log-writer-main" {
  value       = google_project_iam_member.log-writer-main.id
  description = "Org Log Writer Identity"

}

output "org-sink-shared" {
  value       = google_logging_organization_sink.org-sink-shared.id
  description = "Org Log Sink Shared"

}

output "log-writer-shared" {
  value       = google_project_iam_member.log-writer-shared.id
  description = "Org Log Writer Shared writer identity"
}

output "google_pubsub_topic" {
  value       = google_pubsub_topic.pubsub-mn.id
  description = "Main Pubsub Topic ID"
}

output "google_pubsub_topic_shared" {
  value       = google_pubsub_topic.pubsub-shd.id
  description = "Shared pubsub topic id"
}

output "google_pubsub_topic_iam_member_mn" {
  value       = google_pubsub_topic_iam_member.pubsub_sink_member-mn.id
  description = "Pubsub log writer ID"
}

output "google_pubsub_topic_iam_member_shared" {
  value       = google_pubsub_topic_iam_member.pubsub_sink_member-shd.id
  description = "Shared pubsub log writer identity"
}