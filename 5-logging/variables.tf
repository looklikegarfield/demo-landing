variable "project_id" {
  description = "The ID of the project where the log sinks and pub sub will be created"
}

variable "logsinkname" {
  description = "The name of the network being created"
}

variable "pubsubname" {
  description = "Name of the pubsub for log sink"
}

variable "shared_logsinkname" {
  description = "Shared Log Sink name"
}

variable "shared_pubsubname" {
  description = "Shared pubsub for shared log sink"
}

variable "logfilter" {
  description = "Log Filter Primary"
}

variable "shared_logfilter" {
  description = "Log Filter Shared"
}

variable "pubsubtopic_name" {
  description = "Pub Sub topic name"
}

variable "shared_pubsubtopic_name" {
  description = "Shared Pub Sub Topic name"
}

variable "retention" {
  description = "Retention for pub sub"
}

variable "region" {
  description = "Default Region for Log Sink Retention"
}

variable "roles" {
  description = "Role for Log Writer"
}

variable "org_aggregated_logsink_name" {
  description = "Aggregated Org Log Sink Name"
}

variable "org_aggregated_shared_logsink_name" {
  description = "Aggregated Org Log Sink Name"
}

variable "org_id" {
  description = "Org ID"
}