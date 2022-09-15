# providers.tf
terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">= 2.2.0"
    }
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = "vc-l-10a.vcn.ninja.local"
  allow_unverified_ssl = true
}
provider "vsphere" {
  alias                = "vCenter02"
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = "vc-l-20a.vcn.ninja.local"
  allow_unverified_ssl = true
}

provider "vsphere" {
  alias                = "vCenter03"
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = "vc-l-30a.vcn.ninja.local"
  allow_unverified_ssl = true
}

