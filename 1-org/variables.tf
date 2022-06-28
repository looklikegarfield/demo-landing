/*
Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose.
Your use of it is subject to your agreement with Google.
*/

variable "parent" {
  type        = string
  description = "The resource name of the parent Folder or Organization. Must be of the form `folders/folder_id` or `organizations/org_id`."
}

variable "names" {
  type        = list(string)
  description = "Folder names."
}

variable "set_roles" {
  type        = bool
  description = "Enable setting roles via the folder admin variables."
}

variable "billing_account" {
  description = "The ID of the billing account to associate GCP projects with."
  type        = list(string)
}

variable "org_id" {
  description = "GCP Organization ID."
  type        = list(string)
}

variable "grp_billing_viewer" {
  description = "Billing viewer group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_billing_admin" {
  description = "Billing admin group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_org_viewer" {
  description = "Organization viewer group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_org_admin" {
  description = "Organization admin group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_network_viewer" {
  description = "Network viewer group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_network_admin" {
  description = "Network admin group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_security_viewer" {
  description = "Security viewer group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_security_admin" {
  description = "Security admin group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_compute_viewer" {
  description = "Compute viewer group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_compute_admin" {
  description = "Compute admin group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_soc_viewer" {
  description = "SOC viewer group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_soc_admin" {
  description = "SOC admin group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_log_viewer" {
  description = "Logs viewer group. Ex: my-group@my-org.com"
  type        = string
}

variable "grp_monitoring_viewer" {
  description = "Monitoring viewer group. Ex: my-group@my-org.com"
  type        = string
}
