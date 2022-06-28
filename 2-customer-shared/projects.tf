# Copyright 2022 Google LLC
#
# This software is provided as-is, without warranty or representation for any use or purpose.
# Your use of it is subject to your agreement with Google.

/*************************************************
  Modules to create projects in customer-shared folder.
*************************************************/

module "prj-customer-shd-net-conn-hub" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "prj-customer-shd-${var.environment}-net-conn-hub"
  project_id        = "prj-customer-shd-${var.environment}-net-con"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = module.shared_sub_folder.id
  billing_account   = var.billing_account
  activate_apis     = var.prj_customer_shd_net_conn_hub_activate_apis
  labels            = var.prj_customer_shd_net_conn_hub_project_labels
}

module "prj-customer-shd-sec-security" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "prj-customer-shd-${var.environment}-sec-security"
  project_id        = "prj-customer-shd-${var.environment}-sec-sec"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = module.shared_sub_folder.id
  billing_account   = var.billing_account
  activate_apis     = var.prj_customer_shd_sec_security_activate_apis
  labels            = var.prj_customer_shd_sec_security_project_labels
}

module "prj-customer-shd-ops-logging" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "prj-customer-shd-${var.environment}-ops-logging"
  project_id        = "prj-customer-shd-${var.environment}-ops-log"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = module.shared_sub_folder.id
  billing_account   = var.billing_account
  activate_apis     = var.prj_customer_shd_ops_logging_activate_apis
  labels            = var.prj_customer_shd_ops_logging_project_labels
}

module "prj-customer-shd-ops-monitoring" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "prj-customer-shd-${var.environment}-ops-monitoring"
  project_id        = "prj-customer-shd-${var.environment}-ops-mon"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = module.shared_sub_folder.id
  billing_account   = var.billing_account
  activate_apis     = var.prj_customer_shd_ops_monitoring_activate_apis
  labels            = var.prj_customer_shd_ops_monitoring_project_labels
}
