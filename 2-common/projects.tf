# Copyright 2022 Google LLC
#
# This software is provided as-is, without warranty or representation for any use or purpose.
# Your use of it is subject to your agreement with Google.

/*************************************************
  Module to create project in zee-common folder.
*************************************************/
module "prj-customer-common-udp" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "prj-customer-common-${var.environment}-udp"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = module.common_sub_folder.id
  billing_account   = var.billing_account
  activate_apis     = var.prj_customer_common_udp_activate_apis
  labels            = var.prj_customer_common_udp_project_labels
}
