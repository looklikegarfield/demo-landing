# 0-bootstrap

This repo is part of a multi-part guide that shows how to configure and deploy
the example.com reference architecture described in
[Google Cloud security foundations guide](https://services.google.com/fh/files/misc/google-cloud-security-foundations-guide.pdf)
(PDF). The following table lists the parts of the guide.

<table>
<tbody>
<tr>
<td>0-bootstrap (this file)</td>
<td>Bootstraps a Google Cloud organization, creating all the required resources
and permissions to start using the Cloud Foundation Toolkit (CFT). This
step also configures a CI/CD pipeline for foundations code in subsequent
stages.</td>
</tr>
<tr>
<td><a href="../1-org">1-org</a></td>
<td>Sets up top level shared folders, monitoring and networking projects, and
organization-level logging, and sets baseline security settings through
organizational policy.</td>
</tr>
<tr>
<td><a href="../2-environments"><span style="white-space: nowrap;">2-environments</span></a></td>
<td>Sets up development, non-production, and production environments within the
Google Cloud organization that you've created.</td>
</tr>
<tr>
<td><a href="../3-networks">3-networks</a></td>
<td>Sets up base and restricted shared VPCs with default DNS, NAT (optional),
Private Service networking, VPC service controls, on-premises Dedicated
Interconnect, and baseline firewall rules for each environment. Also sets
up the global DNS hub.</td>
</tr>
<tr>
<td><a href="../4-projects">4-projects</a></td>
<td>Set up a folder structure, projects, and application infrastructure pipeline for applications,
 which are connected as service projects to the shared VPC created in the previous stage.</td>
</tr>
<tr>
<td><a href="../5-app-infra">5-app-infra</a></td>
<td>Deploy a simple <a href="https://cloud.google.com/compute/">Compute Engine</a> instance in one of the business unit projects using the infra pipeline set up in 4-projects.</td>
</tr>
</tbody>
</table>

For an overview of the architecture and the parts, see the
[terraform-example-foundation README](https://github.com/terraform-google-modules/terraform-example-foundation)
file.

## Purpose

The purpose of this step is to bootstrap a Google Cloud organization, creating all the required resources & permissions to start using the Cloud Foundation Toolkit (CFT). This step also configures a CI/CD pipeline for foundations code in subsequent stages. The CI/CD pipeline can use either Cloud Build and Cloud Source Repos or Jenkins and your own Git repos (which might live on-premises).

## Prerequisites

To run the commands described in this document, you need to have the following
installed:

- The [Google Cloud SDK](https://cloud.google.com/sdk/install) version 319.0.0 or later
- [Terraform](https://www.terraform.io/downloads.html) version 0.13.7.
- An existing project which the user has access to be used by terraform-validator.

**Note:** Make sure that you use the same version of Terraform throughout this series. Otherwise, you might experience Terraform state snapshot lock errors.

Also make sure that you've done the following:

1. Set up a Google Cloud
   [organization](https://cloud.google.com/resource-manager/docs/creating-managing-organization).
1. Set up a Google Cloud
   [billing account](https://cloud.google.com/billing/docs/how-to/manage-billing-account).
1. Created Cloud Identity or Google Workspace (formerly G Suite) groups for
   organization and billing admins.

### Troubleshooting

Please refer to [troubleshooting](../docs/TROUBLESHOOTING.md) if you run into issues during this step.

## Running Terraform locally

If you deploy using Cloud Build, the bucket information is replaced in the state
backends as a part of the build process when the build is executed by Cloud
Build. If you want to execute Terraform locally, you need to add your Cloud
Storage bucket to the `backend.tf` files. You can update all of these files with
the following steps:

1. Go to the `terraform-example-foundation` directory.
1. Run the following command:
   ```
   for i in `find -name 'backend.tf'`; do sed -i 's/UPDATE_ME/GCS_BUCKET_NAME/' $i; done
   ```
   where `GCS_BUCKET_NAME` is the name of your bucket from the steps you ran
   earlier.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.17.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | terraform-google-modules/kms/google | ~> 2.1 |

## Resources

| Name | Type |
|------|------|
| [google_project_service.gcp_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.org_terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.org_terraform_state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_compute_default_service_account.gcs_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_default_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | List of APIs to enable in the seed project. | `list(string)` | <pre>[<br>  "serviceusage.googleapis.com",<br>  "servicenetworking.googleapis.com",<br>  "compute.googleapis.com",<br>  "logging.googleapis.com",<br>  "bigquery.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "cloudbilling.googleapis.com",<br>  "iam.googleapis.com",<br>  "admin.googleapis.com",<br>  "appengine.googleapis.com",<br>  "storage-api.googleapis.com",<br>  "monitoring.googleapis.com"<br>]</pre> | no |
| <a name="input_bootstrap_project_id"></a> [bootstrap\_project\_id](#input\_bootstrap\_project\_id) | Name of the Bootstrap Project within the Org | `string` | n/a | yes |
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | Default region to create resources where applicable. | `string` | `"us-central1"` | no |
| <a name="input_encrypt_gcs_bucket_tfstate"></a> [encrypt\_gcs\_bucket\_tfstate](#input\_encrypt\_gcs\_bucket\_tfstate) | Encrypt bucket used for storing terraform state files in seed project. | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | If supplied, the state bucket will be deleted even while containing objects. | `bool` | `false` | no |
| <a name="input_key_protection_level"></a> [key\_protection\_level](#input\_key\_protection\_level) | The protection level to use when creating a version based on this template. Default value: "SOFTWARE" Possible values: ["SOFTWARE", "HSM"] | `string` | `"SOFTWARE"` | no |
| <a name="input_key_rotation_period"></a> [key\_rotation\_period](#input\_key\_rotation\_period) | n/a | `string` | `null` | no |
| <a name="input_kms_prevent_destroy"></a> [kms\_prevent\_destroy](#input\_kms\_prevent\_destroy) | Set the prevent\_destroy lifecycle attribute on keys. | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Custom project ID to use for project created. If not supplied, the default id is {project\_prefix}-seed-{random suffix}. | `string` | `""` | no |
| <a name="input_project_labels"></a> [project\_labels](#input\_project\_labels) | Labels to apply to the project. | `map(string)` | `{}` | no |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Name prefix to use for projects created. | `string` | `"cft"` | no |
| <a name="input_storage_bucket_labels"></a> [storage\_bucket\_labels](#input\_storage\_bucket\_labels) | Labels to apply to the storage bucket. | `map(string)` | `{}` | no |
| <a name="input_tf_service_account_id"></a> [tf\_service\_account\_id](#input\_tf\_service\_account\_id) | ID of service account for terraform in seed project | `string` | `"org-terraform"` | no |
| <a name="input_tf_service_account_name"></a> [tf\_service\_account\_name](#input\_tf\_service\_account\_name) | Display name of service account for terraform in seed project | `string` | `"Organization Terraform Account"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcs_bucket_tfstate"></a> [gcs\_bucket\_tfstate](#output\_gcs\_bucket\_tfstate) | Bucket used for storing terraform state for foundations pipelines in seed project. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->