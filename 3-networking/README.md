# 3-networks Terraform Module

The purpose of this step is to set up VPC, Subnets, Firewall Rules and cloud routers.

## Usage

### <u>VPC</u>

Basic usage of vpc is as follows:

```hcl
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 4.0"

    project_id   = "<PROJECT ID>"
    network_name = "example-vpc"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name               = "subnet-03"
            subnet_ip                 = "10.10.30.0/24"
            subnet_region             = "us-west1"
            subnet_flow_logs          = "true"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling = 0.7
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
        }
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }

    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
        {
            name                   = "app-proxy"
            description            = "route through proxy to reach app"
            destination_range      = "10.50.10.0/24"
            tags                   = "app-proxy"
            next_hop_instance      = "app-proxy-instance"
            next_hop_instance_zone = "us-west1-a"
        },
    ]
}
```
Refer to [VPC examples](https://github.com/terraform-google-modules/terraform-google-network/tree/v5.0.0/examples) for additional references

### <u>Firewall Rules</u>

Basic usage of firewall rules is as follows:

```hcl
module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project_id
  network_name = module.vpc.network_name

  rules = [{
    name                    = "allow-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}
```
Refer to [Firewall examples](https://github.com/terraform-google-modules/terraform-google-network/tree/v5.0.0/examples) for additional references


### <u>Cloud Router</u>

Basic usage of vpc is as follows:

```hcl
module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.4"

  name    = "example-router"
  project = "<PROJECT ID>"
  region  = "us-central1"
  network = "default"
}
```
Refer to [Cloud Router examples](https://github.com/terraform-google-modules/terraform-google-cloud-router/tree/master/examples) for additional references

## Inputs

| Name                  | Description                                                                                                           | Type           | Default                                                                                                                                                     | Required |
| --------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| project_id                | GCP Project ID                                                                                                    | `string`       | n/a                                                                                                                                                         |   yes    |
| network_name                | Name of VPC network                                                                                                    | `string`       | n/a                                                                                                                                                         |   yes    |
| routing_mode                | The network routing mode (default 'GLOBAL')                                                                                                    | `string`       | GLOBAL                                                                                                                                                         |   yes    |
| shared_vpc_host           | Shared VPC host true/false.                                                                                               | `bool` | `false`                                                                                                                                                        |   yes    |
| subnets       | List of subnets to be created                                                                                     | `list(map(string))`       | {}                                                                                                                                                         |   yes    |
| secondary_ranges       | Secondary ranges if to be used in subnets.                                                             | `map(list(object({ range_name = string, ip_cidr_range = string })))`       | {}                                                                                                                                                         |   no    |
| routes | List of routes to be created in VPC                                                                                                 | `list(map(string))`       | []                                                                                                                                                         |   no    |
| delete_default_internet_gateway_routes       | If set, all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted                                                                                     | `bool`       | false                                                                                                                                                         |   no    |
| auto_create_subnetworks       | When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources.                                                                                     | `bool`       | false                                                                                                                                                         |   no    |
| mtu       | The network MTU. Must be a value between 1460 and 1500 inclusive. If set to 0 (meaning MTU is unset), the network will default to 1460 automatically                                                                                     | `number`       | 0                                                                                                                                                         |   no    |
| google_destination_range       | The Default Internal Google IP for Whitelising GCP Access from On Premise                                                                                     | `string`       | 199.36.153.8/30                                                                                                                                                         |   no    |
| default_region       | Default region for Cloud Routers                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| zee5_cloud_router_name       | Cloud Router name to be used for zee5                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| zeel_cloud_router_name       | Cloud Router name to be used for zeel                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| zee5_bgp_asn       | BGP ASN for zee5 cloud router                                                                                     | `number`       | n/a                                                                                                                                                         |   yes    |
| zeel_bgp_asn       | BGP ASN for zeel cloud router                                                                                     | `number`       | n/a                                                                                                                                                         |   yes    |
| nat_name       | NAT name to be used                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| fw_rules       | Firewall Rules to be Created on GCP VPC                                                                                     | <pre>list(object({<br>    name                    = string<br>    description             = string<br>    direction               = string<br>    priority                = number<br>    ranges                  = list(string)<br>    source_tags             = list(string)<br>    source_service_accounts = list(string)<br>    target_tags             = list(string)<br>    target_service_accounts = list(string)<br>    allow = list(object({<br>      protocol = string<br>      ports    = list(string)<br>    }))<br>    deny = list(object({<br>      protocol = string<br>      ports    = list(string)<br>    }))<br>    log_config = object({<br>      metadata = string<br>    })<br>  }))</pre>       | []                                                                                                                                                         |   no    |



## Outputs

| Name                     | Description                  |
| ------------------------ | ---------------------------- |
| network_name             | The name of the VPC being created              |
| network_self_link          | The URI of the VPC being created   |
| subnets_names             | The names of the subnets being created              |
| subnets_ips          | The IPs and CIDRs of the subnets being created   |
| subnets_self_links             | The self-links of subnets being created              |
| subnets_regions          | The region where the subnets will be created   |
| subnets_secondary_ranges             | The secondary ranges associated with these subnets              |

## Software

- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.7
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) >= 3.50

## Remote State

`Note: The below steps are already taken care in Github Actions workflow.`

To store the terraform state in remote backend i.e. Google Cloud Storage. Perform the below actions before terraform plan and apply.

- Copy backend.tf.example to backend.tf
- Update 'UPDATEBUCKET' and 'UPDATEENV' values to actual bucket name and environment in backend.tf file. 

## Copyright

Copyright 2022 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.
