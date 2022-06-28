/*
Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose.
Your use of it is subject to your agreement with Google.
*/

variable "org_id" {
  description = "GCP Organization ID."
  type        = string
}

variable "environment" {
  description = "Environment to use."
  type        = string
}

variable "subfolder_names" {
  type        = list(string)
  description = "Sub Folder names."
}

variable "billing_account" {
  description = "The ID of the billing account to associate GCP projects with."
  type        = string
}

variable "prj_customer_shd_net_conn_hub_project_labels" {
  description = "Labels to apply to the GCP project."
  type        = map(string)
}

variable "prj_customer_shd_sec_security_project_labels" {
  description = "Labels to apply to the GCP project."
  type        = map(string)
}

variable "prj_customer_shd_ops_logging_project_labels" {
  description = "Labels to apply to the GCP project."
  type        = map(string)
}

variable "prj_customer_shd_ops_monitoring_project_labels" {
  description = "Labels to apply to the GCP project."
  type        = map(string)
}

variable "prj_customer_shd_net_conn_hub_activate_apis" {
  description = "List of APIs to enable."
  type        = list(string)
}

variable "prj_customer_shd_sec_security_activate_apis" {
  description = "List of APIs to enable"
  type        = list(string)
}

variable "prj_customer_shd_ops_logging_activate_apis" {
  description = "List of APIs to enable."
  type        = list(string)
}

variable "prj_customer_shd_ops_monitoring_activate_apis" {
  description = "List of APIs to enable."
  type        = list(string)
}
