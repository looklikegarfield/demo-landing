# 2-zee-shared Terraform Module

The purpose of this step is to set up second level folders and projects under zee-shared folder.

## Usage

### Folders

Basic usage of folder module is as follows:

```hcl
module "folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.0"

  parent  = "folders/<folder_id>"

  names = [
    "dev",
    "staging",
    "production",
  ]

  set_roles = false
}
```
Refer to [Folder examples](https://github.com/terraform-google-modules/terraform-google-folders/blob/master/examples) for additional references

### Projects

```hcl
module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = "pf-test-1"
  folder_id            = "folders/folder_id"
  org_id               = "1234567890"
  billing_account      = "ABCDEF-ABCDEF-ABCDEF"
  activate_apis        = [ 
    "compute.googleapis.com",
    "iam.googleapis.com",
  ]
  
  labels               = {
    environment       = "production"
    application_name  = "org-scc"
    billing_code      = "1234"
    primary_contact   = "example1"
    secondary_contact = "example2"
    business_code     = "abcd"
    env_code          = "p"
  }
}
```
Refer to [Project examples](https://github.com/terraform-google-modules/terraform-google-project-factory/tree/master/examples) for additional references

## Inputs

| Name                  | Description                                                                                                           | Type           | Default                                                                                                                                                     | Required |
| --------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| environment           | Environment to be used.                                                                                               | `list(string)` | `[]`                                                                                                                                                        |   yes    |
| subfolder_names       | List of sub folders to be created                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| billing_account       | The ID of the billing account to associate projects with.                                                             | `string`       | n/a                                                                                                                                                         |   yes    |
| org_id                | GCP Organization ID                                                                                                   | `string`       | n/a                                                                                                                                                         |   yes    |
| prj_<>_project_labels | Labels to be attached                                                                                                 | `string`       | n/a                                                                                                                                                         |   yes    |
| prj_<>_activate_apis  | APIs to be activated on project                                                                                       | `string`       | n/a                                                                                                                                                         |   yes    |

## Outputs

| Name                     | Description                  |
| ------------------------ | ---------------------------- |
| <>_sub_folder            | Sub folder ids.              |
| project_details          | Details of project created   |

### Software

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.7
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) >= 3.50

### Remote State

`Note: The below steps are already taken care in Github Actions workflow.`

To store the terraform state in remote backend i.e. Google Cloud Storage. Perform the below actions before terraform plan and apply.

- Copy backend.tf.example to backend.tf
- Update 'UPDATEBUCKET' and 'UPDATEENV' values to actual bucket name and environment in backend.tf file. 

## Copyright

Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.
