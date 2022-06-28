# Copyright 2022 Google LLC
#
# This software is provided as-is, without warranty or representation for any use or purpose.
# Your use of it is subject to your agreement with Google.

/*************************************************
  Module to create TOP FOLDERS.
*************************************************/
module "top_folders" {
  source    = "terraform-google-modules/folders/google"
  version   = "~> 3.1.0"
  parent    = var.parent
  names     = var.names
  set_roles = var.set_roles
}
