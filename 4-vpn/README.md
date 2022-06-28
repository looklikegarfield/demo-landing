# 4-vpn Terraform Module

The purpose of this step is to set up VPN with AWS Zee5 and Zeel Accounts.

## Usage

### <u>VPN</u>

Basic usage of HA vpn is as follows:

```hcl
module "vpn-prod-internal" {
  source  = "terraform-google-modules/vpn/google"
  version = "~> 1.2.0"

  project_id         = var.project_id
  network            = "default"
  region             = "us-west1"
  gateway_name       = "vpn-prod-internal"
  tunnel_name_prefix = "vpn-tn-prod-internal"
  shared_secret      = "secrets"
  tunnel_count       = 1
  peer_ips           = ["1.1.1.1", "2.2.2.2"]

  route_priority = 1000
  remote_subnet  = ["10.17.0.0/22", "10.16.80.0/24"]
}
```
Refer to [VPN examples](https://github.com/terraform-google-modules/terraform-google-vpn/tree/master/examples) for additional references

## Inputs

| Name                  | Description                                                                                                           | Type           | Default                                                                                                                                                     | Required |
| --------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| project_id                | GCP Project ID                                                                                                    | `string`       | n/a                                                                                                                                                         |   yes    |
| default_region       | Default region for Cloud Routers                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| vpc_name                | Label to identify the VPC associated with shared VPC that will use the VPN network                                                                                                    | `string`       | n/a                                                                                                                                                         |   yes    |
| vpc_self_link                | VPC Self link                                                                                                    | `string`       | n/a                                                                                                                                                         |   yes    |
| vgw_name           | VPN Gateway name to be used                                                                                               | `string` | n/a                                                                                                                                                        |   yes    |
| vgw_self_link       | VPN Gateway Self link                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| ext_vgw_name       | External VPN Gateway name to be used                                                             | `string`       | n/a                                                                                                                                                         |   yes    |
| aws_peer_gw_ip_address_0 | AWS Peer Gateway IP address 1                                                                                                 | `string`       | n/a                                                                                                                                                         |   yes    |
| aws_peer_gw_ip_address_1       | AWS Peer Gateway IP address 2                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| psk_secret_key_0       | The psk secret key 0                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| psk_secret_key_1       | The psk secret key 1                                                                                     | `string`       | n/a                                                                                                                                                         |   no    |
| bgp_peer_asn       | BGP ASN for cloud routes                                                                                     | `number`       | n/a                                                                                                                                                         |   yes    |
| tunnel0_aws_bgp_peer_address       | AWS BGP Peer IP 1 for tunnel 0                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| tunnel1_aws_bgp_peer_address       | AWS BGP Peer IP 2 for tunnel 0                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| vpn_tunnel_name_0       | VPN Tunnel name 0                                                                                     | `number`       | n/a                                                                                                                                                         |   yes    |
| vpn_tunnel_name_1       | VPN Tunnel name 1                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| tunnel0_aws_bgp_peer_range       | BGP session range for tunnel 0                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| tunnel1_aws_bgp_peer_range       | BGP session range for tunnel 1                                                                                     | `string`       | n/a                                                                                                                                                         |   yes    |
| create_vgw       | create a VPN gateway                                                                                     | `bool`       | false                                                                                                                                                         |   no    |



## Outputs

| Name                     | Description                  |
| ------------------------ | ---------------------------- |
| vgw_id             | VGW id              |
| vgw_self_link          | VGW self link   |
| vpn_interfaces             | VPN Interfaces              |

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
