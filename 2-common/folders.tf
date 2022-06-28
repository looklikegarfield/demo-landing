# Copyright 2022 Google LLC
#
# This software is provided as-is, without warranty or representation for any use or purpose.
# Your use of it is subject to your agreement with Google.

data "google_active_folder" "common" {
  display_name = "customer-common"
  parent       = "organizations/${var.org_id}"
}

/*************************************************
  Module to create SUB FOLDER.
*************************************************/
module "common_sub_folder" {
  source    = "terraform-google-modules/folders/google"
  version   = "~> 3.1.0"
  parent    = data.google_active_folder.common.name
  names     = var.subfolder_names
  set_roles = false
}
