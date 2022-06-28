/*
Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose.
Your use of it is subject to your agreement with Google.
*/

/*************************************************
  Module to assign IAM Roles.
*************************************************/
# Additional Reference: https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules

#locals {
#  sa_iam_email = format("serviceAccount:%s@%s.iam.gserviceaccount.com", var.sa_name, var.project_id)
#  sa_email     = format("%s@%s.iam.gserviceaccount.com", var.sa_name, var.project_id)
#}

/*************************************************
  Module to assign Billing Account IAM Roles.
*************************************************/

# Additional Reference: https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/billing_accounts_iam
#module "billing-admin-iam-bindings" {
#  source              = "terraform-google-modules/iam/google//modules/billing_accounts_iam"
#  version             = "~> 7.4.0"
#  billing_account_ids = var.billing_account
#
#  mode = "additive"
#
#  bindings = {
#    "roles/billing.user" = [
#      "group:${var.grp_billing_admin}",
#    ]
#  }
#}
#
#module "billing-viewer-iam-bindings" {
#  source              = "terraform-google-modules/iam/google//modules/billing_accounts_iam"
#  version             = "~> 7.4.0"
#  billing_account_ids = var.billing_account
#
#  mode = "additive"
#
#  bindings = {
#    "roles/billing.viewer" = [
#      "group:${var.grp_billing_viewer}",
#    ]
#  }
#}
/*************************************************
  Module to assign Organization IAM Roles.
*************************************************/

/*# Additional Reference: https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/organizations_iam
module "org-admin-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/resourcemanager.organizationAdmin" = [
      "group:${var.grp_org_admin}",
    ]

    "roles/resourcemanager.folderAdmin" = [
      "group:${var.grp_org_admin}",
    ]

    "roles/resourcemanager.projectCreator" = [
      "group:${var.grp_org_admin}",
    ]

    "roles/iam.organizationRoleAdmin" = [
      "group:${var.grp_org_admin}",
    ]

   # "roles/serviceusage.serviceUsageAdmin" = [
   #   "group:${var.grp_org_admin}",
   # ]
#
   # "roles/cloudsupport.techSupportEditor" = [
   #   "group:${var.grp_org_admin}",
   # ]
#
   # "roles/essentialcontacts.admin" = [
   #   "group:${var.grp_org_admin}",
   # ]
#
   # "roles/billing.user" = [
   #   "group:${var.grp_org_admin}",
   # ]
  }
}

module "org-viewer-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_org_viewer}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_org_viewer}",
    ]

    "roles/serviceusage.serviceUsageViewer" = [
      "group:${var.grp_org_viewer}",
    ]

    "roles/iam.organizationRoleViewer" = [
      "group:${var.grp_org_viewer}",
    ]
  }
}
*/
/*
module "network-admin-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/compute.networkAdmin" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/compute.xpnAdmin" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/compute.loadBalancerAdmin" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/dns.admin" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/networkmanagement.admin" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/recommender.firewallAdmin" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/cloudsupport.techSupportEditor" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/servicemanagement.quotaViewer" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_network_admin}",
    ]

    "roles/logging.viewer" = [
      "group:${var.grp_network_admin}",
    ]
  }
}

module "network-viewer-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/compute.networkViewer" = [
      "group:${var.grp_network_viewer}",
    ]

    "roles/dns.reader" = [
      "group:${var.grp_network_viewer}",
    ]

    "roles/networkmanagement.viewer" = [
      "group:${var.grp_network_viewer}",
    ]

    "roles/recommender.firewallViewer" = [
      "group:${var.grp_network_viewer}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_network_viewer}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_network_viewer}",
    ]
  }
}

module "security-admin-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/orgpolicy.policyAdmin" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/compute.orgFirewallPolicyAdmin" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/iam.securityAdmin" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/resourcemanager.folderIamAdmin" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/cloudkms.admin" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/logging.privateLogViewer" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/logging.configWriter" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/compute.securityAdmin" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/recommender.iamAdmin" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/iam.serviceAccountAdmin" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/secretmanager.admin" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/cloudsupport.techSupportEditor" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/securitycenter.findingsViewer" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/securitycenter.assetsViewer" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/compute.networkViewer" = [
      "group:${var.grp_security_admin}",
    ]

    "roles/compute.viewer" = [
      "group:${var.grp_security_admin}",
    ]
  }
}

module "security-viewer-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/orgpolicy.policyViewer" = [
      "group:${var.grp_security_viewer}",
    ]

    "roles/iam.securityReviewer" = [
      "group:${var.grp_security_viewer}",
    ]

    "roles/logging.privateLogViewer" = [
      "group:${var.grp_security_viewer}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_security_viewer}",
    ]

    "roles/secretmanager.viewer" = [
      "group:${var.grp_security_viewer}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_security_viewer}",
    ]

    "roles/compute.networkViewer" = [
      "group:${var.grp_security_viewer}",
    ]

    "roles/recommender.iamViewer" = [
      "group:${var.grp_security_viewer}",
    ]

    "roles/compute.viewer" = [
      "group:${var.grp_security_viewer}",
    ]
  }
}

module "compute-admin-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/compute.instanceAdmin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/iam.serviceAccountUser" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/compute.networkUser" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/compute.storageAdmin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/storage.admin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/container.admin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/cloudsql.admin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/pubsub.admin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/cloudbuild.builds.editor" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/logging.admin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/monitoring.admin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/cloudsupport.techSupportEditor" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/cloudkms.cryptoKeyEncrypterDecrypter" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/secretmanager.admin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/recommender.computeAdmin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/source.admin" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/servicemanagement.quotaViewer" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/compute.networkViewer" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_compute_admin}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_compute_admin}",
    ]
  }
}

module "compute-viewer-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/compute.viewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/storage.objectViewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/container.viewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/cloudsql.viewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/pubsub.viewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/logging.viewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/monitoring.viewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/compute.networkViewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/source.reader" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/recommender.computeViewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_compute_viewer}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_compute_viewer}",
    ]
  }
}

module "log-viewer-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/logging.viewer" = [
      "group:${var.grp_log_viewer}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_log_viewer}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_log_viewer}",
    ]
  }
}

module "monitoring-viewer-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/monitoring.viewer" = [
      "group:${var.grp_monitoring_viewer}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_monitoring_viewer}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_monitoring_viewer}",
    ]
  }
}

module "soc-admin-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/securitycenter.admin" = [
      "group:${var.grp_soc_admin}",
    ]

    "roles/cloudsupport.techSupportEditor" = [
      "group:${var.grp_soc_admin}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_soc_admin}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_soc_admin}",
    ]
  }
}

module "soc-viewer-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.0"
  organizations = var.org_id
  mode          = "additive"

  bindings = {
    "roles/securitycenter.adminViewer" = [
      "group:${var.grp_soc_viewer}",
    ]

    "roles/resourcemanager.organizationViewer" = [
      "group:${var.grp_soc_viewer}",
    ]

    "roles/resourcemanager.folderViewer" = [
      "group:${var.grp_soc_viewer}",
    ]
  }
}
*/
