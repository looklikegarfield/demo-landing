/*
Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose.
Your use of it is subject to your agreement with Google.
*/

output "shared_sub_folder" {
  description = "customer-shared sub folder ids."
  value       = module.shared_sub_folder.ids
}

output "project_details_1" {
  value = {
    project_id     = module.prj-customer-shd-net-conn-hub.project_id
    project_name   = module.prj-customer-shd-net-conn-hub.project_name
    project_number = module.prj-customer-shd-net-conn-hub.project_number
  }
}

output "project_details_2" {
  value = {
    project_id     = module.prj-customer-shd-sec-security.project_id
    project_name   = module.prj-customer-shd-sec-security.project_name
    project_number = module.prj-customer-shd-sec-security.project_number
  }
}

output "project_details_3" {
  value = {
    project_id     = module.prj-customer-shd-ops-logging.project_id
    project_name   = module.prj-customer-shd-ops-logging.project_name
    project_number = module.prj-customer-shd-ops-logging.project_number
  }
}

output "project_details_4" {
  value = {
    project_id     = module.prj-customer-shd-ops-monitoring.project_id
    project_name   = module.prj-customer-shd-ops-monitoring.project_name
    project_number = module.prj-customer-shd-ops-monitoring.project_number
  }
}
