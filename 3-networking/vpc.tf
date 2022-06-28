module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 4.0"

  project_id                             = var.project_id
  network_name                           = var.network_name
  routing_mode                           = var.routing_mode
  shared_vpc_host                        = var.shared_vpc_host
  subnets                                = var.subnets
  secondary_ranges                       = var.secondary_ranges
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes

  routes = var.routes
}
