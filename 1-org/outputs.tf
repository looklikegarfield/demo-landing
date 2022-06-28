/*
Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose.
Your use of it is subject to your agreement with Google.
*/

output "top_folders_ids" {
  description = "Top folder ids."
  value       = module.top_folders.ids
}

