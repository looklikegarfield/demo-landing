/*
Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose.
Your use of it is subject to your agreement with Google.
*/

resource "google_organization_policy" "resource_location_policy" {
  org_id     = var.org_id
  constraint = "constraints/gcp.resourceLocations"
  list_policy {
    allow {
      values = var.gcp_india_regions
    }
  }
}

resource "google_organization_policy" "serviceuser_policy" {
  org_id     = var.org_id
  constraint = "constraints/serviceuser.services"
  list_policy {
    allow {
      all = true
    }
  }
}

resource "google_organization_policy" "public_access_prevention_policy" {
  org_id     = var.org_id
  constraint = "constraints/storage.publicAccessPrevention"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "uniform_bucket_level_access_policy" {
  org_id     = var.org_id
  constraint = "constraints/storage.uniformBucketLevelAccess"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "diable_gues_access_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.disableGuestAttributesAccess"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "disable_internet_network_endpoint_group_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.disableInternetNetworkEndpointGroup"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "disable_nested_virt_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.disableNestedVirtualization"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "disable_serial_port_logging_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.disableSerialPortLogging"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "requires_os_login_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.requireOsLogin"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "require_shielded_vm_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.requireShieldedVm"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "skip_default_network_creation_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.skipDefaultNetworkCreation"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "trusted_image_projects_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.trustedImageProjects"
  list_policy {
    allow {
      all = true
    }
  }
}

resource "google_organization_policy" "vm_external_ip_access_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.vmExternalIpAccess"
  list_policy {
    allow {
      all = true
    }
  }
}

resource "google_organization_policy" "service_account_credential_policy" {
  org_id     = var.org_id
  constraint = "constraints/iam.allowServiceAccountCredentialLifetimeExtension"
  list_policy {
    allow {
      all = true
    }
  }
}

resource "google_organization_policy" "allowed_policy_member_domains_policy" {
  org_id     = var.org_id
  constraint = "constraints/iam.allowedPolicyMemberDomains"
  list_policy {
    allow {
      values = [var.allowed_domains]
    }
  }
}

resource "google_organization_policy" "disable_service_account_creation_policy" {
  org_id     = var.org_id
  constraint = "constraints/iam.disableServiceAccountKeyCreation"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "disable_sa_key_upload_policy" {
  org_id     = var.org_id
  constraint = "constraints/iam.disableServiceAccountKeyUpload"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "restrict_xpn_projectlien_removal_policy" {
  org_id     = var.org_id
  constraint = "constraints/compute.restrictXpnProjectLienRemoval"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "automatic_iam_for_default_sa_policy" {
  org_id     = var.org_id
  constraint = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "restrict_authorized_networks_policy" {
  org_id     = var.org_id
  constraint = "constraints/sql.restrictAuthorizedNetworks"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "restrict_public_ip_policy" {
  org_id     = var.org_id
  constraint = "constraints/sql.restrictPublicIp"
  boolean_policy {
    enforced = true
  }
}