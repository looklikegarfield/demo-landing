project_id   = "prj-customer-shd-uat-net-con-c315"
network_name = "vpc-shd-uat-net-conn-hub-svpc-01"
subnets = [{
  subnet_name           = "sub-shd-uat-net-conn-hub-svpc-01-as1-01"
  subnet_ip             = "10.195.0.0/23"
  subnet_region         = "asia-south1"
  subnet_private_access = "true"
  subnet_flow_logs      = "false"
  description           = "This subnet has a description"
}]
shared_vpc_host                        = true
delete_default_internet_gateway_routes = true

fw_rules = [{
  name                    = "fw-shd-uat-net-conn-hub-svpc-01-in-int-all-all-all-allow"
  description             = "Allow all GCP Internal Traffic"
  direction               = "INGRESS"
  priority                = 1000
  ranges                  = ["10.195.0.0/16"]
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
#zee5_cloud_router_name = "cr-shd-uat-net-conn-hub-svpc-01-zee5-as1-01"
#zeel_cloud_router_name = "cr-shd-uat-net-conn-hub-svpc-01-zeel-as1-01"
#zee5_bgp_asn           = "65001"
#zeel_bgp_asn           = "65002"
nat_name               = "nat-shd-uat-net-conn-hub-svpc-01-as1-01"
environment            = "uat"
