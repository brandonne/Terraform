# Gateway Creation

# Data Sources
data "nsxt_policy_tier0_gateway" "tier0_router" {
  display_name = "${var.nsx_data_vars["t0_router_name"]}"
}

data "nsxt_policy_edge_cluster" "edge_cluster1" {
    display_name = "${var.nsx_data_vars["edge_cluster"]}"
}

# Resources
# Create T1 router
resource "nsxt_policy_tier1_gateway" "tier1_gw" {
  description                 = "Tier1 router provisioned by Terraform"
  display_name                = "${var.nsx_rs_vars["t1_router_name"]}"
  failover_mode               = "PREEMPTIVE"
  edge_cluster_path            = "${data.nsxt_policy_edge_cluster.edge_cluster1.path}"
  tier0_path                  = data.nsxt_policy_tier0_gateway.tier0_router.path
  route_advertisement_types  = ["TIER1_STATIC_ROUTES","TIER1_CONNECTED","TIER1_NAT"]
    tag {
	scope = "${var.nsx_tag_scope}"
	tag = "${var.nsx_tag}"
    }
}


