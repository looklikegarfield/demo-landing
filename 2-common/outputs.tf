/*
Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose.
Your use of it is subject to your agreement with Google.
*/

output "common_sub_folder" {
  description = "customer-common sub folder ids."
  value       = module.common_sub_folder.ids
}

output "project_details" {
  value = {
    project_id     = module.prj-customer-common-udp.project_id
    project_name   = module.prj-customer-common-udp.project_name
    project_number = module.prj-customer-common-udp.project_number
  }
}
