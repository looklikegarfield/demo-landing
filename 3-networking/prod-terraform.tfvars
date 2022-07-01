project_id   = "prj-shd-prd-net-con-5d14"
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
  ranges                  = ["10.0.0.0/8"]
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
    ranges                  = ["10.0.0.0/8"]
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
    ranges                  = ["10.0.0.0/8"]
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
    ranges                  = ["10.0.0.0/8"]
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
    ranges                  = ["10.0.0.0/8"]
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
environment            = "prod"
