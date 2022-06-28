variable "activate_apis" {
  description = "List of APIs to enable in the seed project."
  type        = list(string)

  default = [
    "serviceusage.googleapis.com",
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "iam.googleapis.com",
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "storage-api.googleapis.com",
    "monitoring.googleapis.com"
  ]
}

variable "bootstrap_project_id" {
  description = "Name of the Bootstrap Project within the Org"
  type        = string
  default     = "529467127917"
}

variable "tf_service_account_id" {
  description = "ID of service account for terraform in seed project"
  type        = string
  default     = "org-terraform"
}

variable "tf_service_account_name" {
  description = "Display name of service account for terraform in seed project"
  type        = string
  default     = "Organization Terraform Account"
}

variable "encrypt_gcs_bucket_tfstate" {
  description = "Encrypt bucket used for storing terraform state files in seed project."
  type        = bool
  default     = false
}

variable "default_region" {
  description = "Default region to create resources where applicable."
  type        = string
  default     = "asia-south1"
}

variable "project_labels" {
  description = "Labels to apply to the project."
  type        = map(string)
  default     = {}
}

variable "project_prefix" {
  description = "Name prefix to use for projects created."
  default     = "test"
  type        = string
}

variable "project_id" {
  description = "Custom project ID to use for project created. If not supplied, the default id is {project_prefix}-seed-{random suffix}."
  default     = ""
  type        = string
}

variable "key_protection_level" {
  type        = string
  description = "The protection level to use when creating a version based on this template. Default value: \"SOFTWARE\" Possible values: [\"SOFTWARE\", \"HSM\"]"
  default     = "SOFTWARE"
}

variable "key_rotation_period" {
  type    = string
  default = null
}

variable "kms_prevent_destroy" {
  description = "Set the prevent_destroy lifecycle attribute on keys."
  default     = true
}

variable "storage_bucket_labels" {
  description = "Labels to apply to the storage bucket."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "If supplied, the state bucket will be deleted even while containing objects."
  type        = bool
  default     = false
}