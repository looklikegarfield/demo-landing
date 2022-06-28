locals {
  state_bucket_name = format("%s-%s-%s", var.project_prefix, "tfstate", random_id.suffix.hex)
}

resource "random_id" "suffix" {
  byte_length = 2
}

/******************************************
  APIs Enablement 
 *****************************************/

resource "google_project_service" "gcp_services" {
  for_each = toset(var.activate_apis)
  project  = var.bootstrap_project_id
  service  = each.key
}

/******************************************
  Bucket for State Management
 *****************************************/

resource "google_storage_bucket" "org_terraform_state" {
  project                     = var.bootstrap_project_id
  name                        = local.state_bucket_name
  location                    = var.default_region
  labels                      = var.storage_bucket_labels
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}