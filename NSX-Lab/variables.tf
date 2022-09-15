# Put variable declarations in here, along with default values
# sensitive variables will be overwritten with data from terraform.tfvars or Environment Variables

# Variables for NSX
variable "nsx" {
  type = map
  description = "NSX Login Details"
  default = {
    hostname  = "nsxmgr.lab.local"
    user = "admin"
    password = "password"
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
    hostname = "vcenter.lab.local"
    user     = "administrator@vsphere.local"
    password = "VMware1!"
  }
}

# Plan Specific variables

# Variables for Data Sources

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


variable "vsphere_rs_vars" {
  type = map
  description = "vSphere vars for Resources"
  default = {
    vm = "VM_name"
  }
}
variable "dns_server_list" {
    type = list
    description = "DNS Servers"
  default = ["192.168.110.0"]
}

variable "ip_set" {
  type = string
  description = "List of ip addresses that will be add in the IP-SET to allow communication to all VMs"
  default = "192.168.110.10"
}

variable "app_listen_port" {
  type = string
  description = "TCP Port the App server listens on"
  default = "8443"
}

#variable "db_user" {
#    type = string
#    description = "DB Details"
#}
#
#variable "db_pass" {
#    type = string
#    description = "DB Details"
#}
#
#variable "db_name" {
#    type = string
#    description = "DB Details"
#}


# Variables for VM deployment

#variable "web" {
#    type = map
#    description = "NSX vars for the resources"
#}
#variable "app" {
#    type = map
#    description = "NSX vars for the resources"
#}
#variable "db" {
#    type = map
#    description = "NSX vars for the resources"
#}

#
#db_user = "medicalappuser" # Database details
#db_name = "medicalapp"
#db_pass = "VMware1!"
#
#web = {
#    ip = "10.29.15.210"
#    gw = "10.29.15.209"
#    mask = "28"
#    nat_ip = "" # If the ip above is routable and has internet access you can leave the NAT IP blank
#    vm_name = "web"
#    domain = "yasen.local"
#    user = "root" # Credentails to access the VM
#    pass = "VMware1!"
#}
#
#app = {
#    ip = "192.168.245.21" # If this IP is not routable and has no internet access you need to condigure a NAT IP below
#    gw = "192.168.245.1"
#    mask = "24"
#    nat_ip = "10.29.15.229"
#    vm_name = "app"
#    domain = "yasen.local"
#    user = "root"
#    pass = "VMware1!"
#}
#
#db = {
#    ip = "192.168.247.21"
#    gw = "192.168.247.1"
#    mask = "24"
#    nat_ip = "10.29.15.228"
#    vm_name = "db"
#    domain = "yasen.local"
#    user = "root"
#    pass = "VMware1!"
#}

