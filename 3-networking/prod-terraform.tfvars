project_id   = "prj-customer-shd-prd-net-con-4367"
network_name = "vpc-shd-prd-net-conn-hub-svpc-01"
subnets = [{
  subnet_name           = "sub-shd-prd-net-conn-hub-svpc-01-as1-01"
  subnet_ip             = "10.196.0.0/23"
  subnet_region         = "asia-south1"
  subnet_private_access = "true"
  subnet_flow_logs      = "false"
  description           = "This subnet has a description"
}]
shared_vpc_host                        = true
delete_default_internet_gateway_routes = true

fw_rules = [{
  name                    = "fw-shd-prd-net-conn-hub-svpc-01-in-int-all-all-all-allow"
  description             = "Allow all GCP Internal Traffic"
  direction               = "INGRESS"
  priority                = 1000
  ranges                  = ["10.196.0.0/16"]
  source_tags             = null
  source_service_accounts = null
  target_tags             = null
  target_service_accounts = null
  allow = [{
    protocol = "all"
    ports    = null
  }]
  deny       = []
  log_config = null
  },
  {
    name                    = "fw-shd-prd-net-conn-hub-svpc-01-in-z5-prd-all-all-all-allow"
    description             = "Allow all Prod Traffic"
    direction               = "INGRESS"
    priority                = 1001
    ranges                  = ["10.1.0.0/16", "172.16.0.0/20", "10.192.0.0/16", "172.16.0.0/16", "10.162.0.0/16", "172.31.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
      ports    = null
    }]
    deny       = []
    log_config = null
  },
  {
    name                    = "fw-shd-prd-net-conn-hub-svpc-01-in-z5-infmx-all-all-all-allow"
    description             = "Allow all AWS Infonomix Traffic"
    direction               = "INGRESS"
    priority                = 1002
    ranges                  = ["10.158.0.0/16", "10.0.0.0/16", "172.31.0.0/16", "10.157.0.0/16", "10.166.0.0/16", "10.167.0.0/16", "172.30.0.0/16", "10.156.0.0/16", "10.155.0.0/16", "10.164.0.0/16", "10.165.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
      ports    = null
    }]
    deny       = []
    log_config = null
  },
  {
    name                    = "fw-shd-prd-net-conn-hub-svpc-01-in-z5-ds-all-all-all-allow"
    description             = "Allow all AWS  Data Science Traffic"
    direction               = "INGRESS"
    priority                = 1003
    ranges                  = ["10.2.0.0/16", "172.31.0.0/16", "10.40.0.0/16", "10.50.0.0/16", "10.217.0.0/16", "10.0.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
      ports    = null
    }]
    deny       = []
    log_config = null
  },
  {
    name                    = "fw-shd-prd-net-conn-hub-svpc-01-in-zl-tatya-all-all-all-allow"
    description             = "Allow all Traffic"
    direction               = "INGRESS"
    priority                = 1003
    ranges                  = ["10.32.46.0/23", "10.194.0.0/16", "172.31.0.0/16"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "all"
      ports    = null
    }]
    deny       = []
    log_config = null
  }
]

default_region         = "asia-south1"
#zee5_cloud_router_name = "cr-shd-prd-net-conn-hub-svpc-01-zee5-as1-01"
#zeel_cloud_router_name = "cr-shd-prd-net-conn-hub-svpc-01-zeel-as1-01"
#zee5_bgp_asn           = "64525"
#zeel_bgp_asn           = "64523"
nat_name               = "nat-shd-prd-net-conn-hub-svpc-01-as1-01"