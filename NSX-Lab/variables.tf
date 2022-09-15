# Put variable declarations in here, along with default values
# sensitive variables will be overwritten with data from terraform.tfvars or Environment Variables

# Variables for NSX
variable "nsx" {
  type = map
  description = "NSX Login Details"
  default = {
    hostname  = "192.168.110.201"
    user = "admin"
    password = "Password"
  }
}

# I like to apply a tag to all items deployed from this plan
variable "nsx_tag_scope" {
  type = string
  description = "Scope for the tag that will be applied to all resources"
  default = "tf-plan"
}
variable "nsx_tag" {
  type        = string
  description = "Tag, the value for the scope above"
  default = "demo"
}

# Variables for vSphere
variable "vsphere" {
  type        = map
  description = "vSphere Details"
  default     = {
    user     = "administrator@vsphere.local"
    password = "VMware1!"
    hostname       = "192.168.110.22"
  }
}

# Plan Specific variables

# Variables for Data
variable "nsx_data_vars" {
  type = map
  description = "Existing NSX vars for data sources"
  default = {
      transport_zone  = "nsx-overlay-transportzone"
      t0_router_name = "T0-GW"
      edge_cluster = "EdgeCluster"
      t1_router_name = "tf-T1GW"
      dhcp_server = "Default"
  }
}

# Variables for resources I am creating
variable "nsx_rs_vars" {
  type = map
  description = "NSX vars for the resources"
  default = {
      t1_gw_name = "tf-T1GW"
  }
}

variable "nsx_data_vars" {
  type = map
  description = "Existing vSphere vars for data sources"
  default = {
    dc            = "DC-SiteA"
    datastore     = "NFS"
    resource_pool = "Compute-Cluster/Resources"
    vm_template   = "t_template_novra"
  }
}

variable "vsphere_rs_vars" {
  type = map
  description = "vSphere vars for Resources"
  default = {
    vm = "VM_name"
  }
}