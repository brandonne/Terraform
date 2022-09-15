# variables.tf

# vSphere Infrastructure Details

# Datacenters
data "vsphere_datacenter" "datacenter-DC01" {
  name = "Protected DC01"
}data "vsphere_datacenter" "datacenter-DC02" {
  name = "Protected DC02"
}data "vsphere_datacenter" "datacenter-DC03" {
  name = "Protected DC03"
}

# DC01 
data "vsphere_compute_cluster" "cluster-DC01" {
  name          = "Cluster01"
  datacenter_id = data.vsphere_datacenter.datacenter-DC01.id
}

data "vsphere_resource_pool" "RP-DC01" {
  name          = format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  datacenter_id = data.vsphere_datacenter.datacenter-DC01.id
}

data "vsphere_host" "host11" {
  name          = "esxi-11a.vcn.ninja.local"
  datacenter_id = data.vsphere_datacenter.datacenter-DC01.id
}
data "vsphere_host" "host12" {
  name          = "esxi-12a.vcn.ninja.local"
  datacenter_id = data.vsphere_datacenter.datacenter-DC01.id


data "vsphere_network" "network-DC01" {
  name          = "vDS-Production-MGMT"
  datacenter_id = data.vsphere_datacenter.datacenter-DC01.id
}

data "vsphere_folder" "folder-DC01" {
  path = "/${data.vsphere_datacenter.datacenter-DC01.name}/vm/DRaas Connectors"
}

## Local OVF/OVA Source
data "vsphere_ovf_vm_template" "ovfLocal" {
  name              = "foo"
  disk_provisioning = "thin"
  resource_pool_id  = data.vsphere_resource_pool.default.id
  datastore_id      = data.vsphere_datastore.datastore.id
  host_system_id    = data.vsphere_host.host.id
  local_ovf_path    = "/terraform/vmware-cloud-connector.ova"
  ovf_network_map = {
      "vDS-Production-MGMT" : data.vsphere_network.network.id
  }
}
 
# vCenter Credential Variables
variable "vsphere_user" {}
variable "vsphere_password" {}
