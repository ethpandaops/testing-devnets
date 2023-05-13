////////////////////////////////////////////////////////////////////////////////////////
//                            TERRAFORM PROVIDERS & BACKEND
////////////////////////////////////////////////////////////////////////////////////////
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    region                      = "us-east-1"
    bucket                      = "merge-testnets"
    key                         = "infrastructure/testing-devnet/terraform.tfstate"
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}
////////////////////////////////////////////////////////////////////////////////////////
//                                        VARIABLES
////////////////////////////////////////////////////////////////////////////////////////
variable "ethereum_network" {
  type    = string
  default = "testing-devnet"
}

variable "digitalocean_project_name" {
  type    = string
  default = "mainnet-incident-11-05"
}

variable "digitalocean_ssh_key_name" {
  type    = string
  default = "shared-devops-eth2"
}

variable "digitalocean_vpcs" {
  type = map
  default = {
    "ams3" = {
      name = "testing-devnet-ams"
      ip_range = "10.100.75.0/24"
    },
    "nyc3" = {
      name = "testing-devnet-nyc3"
      ip_range = "10.100.76.0/24"
    },
    "blr1" = {
      name = "testing-devnet-blr1"
      ip_range = "10.100.78.0/24"
    },
  }
}

variable "digitalocean_vm_groups" {
  type = list(any)
  default = [
    {
      id = "bootnode"
      vms = {
        "1" = {}
        "2" = { region = "nyc3" }
        "3" = { region = "blr1" }
      }
    },
    // Lighthouse combos
    {
      id = "lighthouse-geth"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "blr1"}
        "5" = {region = "blr1"}
        "6" = {region = "blr1"}
        "7" = {region = "blr1"}
        "8" = {region = "blr1"}
        "9" = {region = "blr1"}
        "10" = {region = "blr1"}
        "11" = {region = "blr1"}
        "12" = {region = "blr1"}
        "13" = {region = "blr1"}
        "14" = {region = "blr1"}
        "15" = {region = "blr1"}
        "16" = {region = "blr1"}
        "17" = {region = "blr1"}
        "18" = {region = "blr1"}
        "19" = {region = "blr1"}
        "20" = {region = "nyc3"}
        "21" = {region = "nyc3"}
        "22" = {region = "nyc3"}
        "23" = {region = "nyc3"}
        "24" = {region = "nyc3"}
        "25" = {region = "nyc3"}
        "26" = {region = "nyc3"}
        "27" = {region = "nyc3"}
        "28" = {region = "nyc3"}
        "29" = {region = "nyc3"}
        "30" = {region = "nyc3"}
        "31" = {region = "nyc3"}
        "32" = {region = "nyc3"}
        "33" = {region = "nyc3"}
        "34" = {region = "nyc3"}
        "35" = {region = "nyc3"}
        "36" = {region = "nyc3"}
        "37" = {region = "nyc3"}
        "38" = {region = "nyc3"}
        "39" = {region = "nyc3"}
        "40" = {region = "nyc3"}
        "41" = {}
        "42" = {}
        "43" = {}
        "44" = {}
        "45" = {}
        "46" = {}
        "47" = {}
        "48" = {}
        "49" = {}
        "50" = {}
        "51" = {}
        "52" = {}
        "53" = {}
        "54" = {}
        "55" = {}
        "56" = {}
        "57" = {}
        "58" = {}
        "59" = {}
        "60" = {}
        "61" = {}
        "62" = {}
        "63" = {}
        "64" = {}
        "65" = {}
        "66" = {}
        "67" = {}
        "68" = {}
        "69" = {}
      },
    },
    {
      id = "lighthouse-besu"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "nyc3"}
        "5" = {region = "nyc3"}
        "6" = {region = "nyc3"}
        "7" = {region = "nyc3"}
        "8" = {region = "nyc3"}
        "9" = {}
        "10" = {}
        "11" = {}
        "12" = {}
      },
    },
    {
      id = "lighthouse-nethermind"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "blr1"}
        "5" = {region = "blr1"}
        "6" = {region = "blr1"}
        "7" = {region = "blr1"}
        "8" = {region = "nyc3"}
        "9" = {region = "nyc3"}
        "10" = {region = "nyc3"}
        "11" = {region = "nyc3"}
        "12" = {region = "nyc3"}
        "13" = {region = "nyc3"}
        "14" = {region = "nyc3"}
        "15" = {region = "nyc3"}
        "16" = {region = "nyc3"}
        "17" = {region = "nyc3"}
        "18" = {region = "nyc3"}
        "19" = {region = "nyc3"}
        "20" = {region = "nyc3"}
        "21" = {}
      },
    },
    {
      id = "lighthouse-erigon"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "nyc3"}
        "5" = {region = "nyc3"}
        "6" = {region = "nyc3"}
        "7" = {region = "nyc3"}
        "8" = {}
        "9" = {}
        "10" = {}
        "11" = {}
        "12" = {}
      },
    },
    // Prysm combos
    {
      id = "prysm-geth"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "blr1"}
        "5" = {region = "blr1"}
        "6" = {region = "blr1"}
        "7" = {region = "blr1"}
        "8" = {region = "blr1"}
        "9" = {region = "blr1"}
        "10" = {region = "blr1"}
        "11" = {region = "blr1"}
        "12" = {region = "blr1"}
        "13" = {region = "blr1"}
        "14" = {region = "blr1"}
        "15" = {region = "blr1"}
        "16" = {region = "blr1"}
        "17" = {region = "blr1"}
        "18" = {region = "blr1"}
        "19" = {region = "blr1"}
        "20" = {region = "blr1"}
        "21" = {region = "nyc3"}
        "22" = {region = "nyc3"}
        "23" = {region = "nyc3"}
        "24" = {region = "nyc3"}
        "25" = {region = "nyc3"}
        "26" = {region = "nyc3"}
        "27" = {region = "nyc3"}
        "28" = {region = "nyc3"}
        "29" = {region = "nyc3"}
        "30" = {region = "nyc3"}
        "31" = {region = "nyc3"}
        "32" = {region = "nyc3"}
        "33" = {region = "nyc3"}
        "34" = {region = "nyc3"}
        "35" = {region = "nyc3"}
        "36" = {region = "nyc3"}
        "37" = {region = "nyc3"}
        "38" = {region = "nyc3"}
        "39" = {region = "nyc3"}
        "40" = {region = "nyc3"}
        "41" = {region = "nyc3"}
        "42" = {region = "nyc3"}
        "43" = {region = "nyc3"}
        "44" = {region = "nyc3"}
        "45" = {region = "nyc3"}
        "46" = {}
        "47" = {}
        "48" = {}
        "49" = {}
        "50" = {}
        "51" = {}
        "52" = {}
        "53" = {}
        "54" = {}
        "55" = {}
        "56" = {}
        "57" = {}
        "58" = {}
        "59" = {}
        "60" = {}
        "61" = {}
        "62" = {}
        "63" = {}
        "64" = {}
        "65" = {}
        "66" = {}
        "67" = {}
        "68" = {}
        "69" = {}
      },
    },
    {
      id = "prysm-besu"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "blr1"}
        "5" = {region = "blr1"}
        "6" = {region = "blr1"}
        "7" = {region = "nyc3"}
        "8" = {region = "nyc3"}
        "9" = {region = "nyc3"}
        "10" = {region = "nyc3"}
        "11" = {}
        "12" = {}
      },
    },
    {
      id = "prysm-nethermind"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "blr1"}
        "5" = {region = "blr1"}
        "6" = {region = "blr1"}
        "7" = {region = "nyc3"}
        "8" = {region = "nyc3"}
        "9" = {region = "nyc3"}
        "10" = {region = "nyc3"}
        "11" = {region = "nyc3"}
        "12" = {region = "nyc3"}
        "13" = {region = "nyc3"}
        "14" = {region = "nyc3"}
        "15" = {region = "nyc3"}
        "16" = {}
        "17" = {}
        "18" = {}
        "19" = {}
        "20" = {}
        "21" = {}
      },
    },
    {
      id = "prysm-erigon"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "blr1"}
        "5" = {region = "nyc3"}
        "6" = {region = "nyc3"}
        "7" = {region = "nyc3"}
        "8" = {region = "nyc3"}
        "9" = {region = "nyc3"}
        "10" = {}
        "11" = {}
        "12" = {}
      },
    },
    // Lodestar combos
    {
      id = "lodestar-geth"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "nyc3"}
        "3" = {}
      }
    },
    // Nimbus combos
    {
      id = "nimbus-geth"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "blr1"}
        "5" = {region = "nyc3"}
        "6" = {region = "nyc3"}
        "7" = {region = "nyc3"}
        "8" = {region = "nyc3"}
        "9" = {}
      }
    },
    {
      id = "nimbus-besu"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "nyc3"}
        "3" = {}
      },
    },
    {
      id = "nimbus-nethermind"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "nyc3"}
        "3" = {}
      }
    },
    {
      id = "nimbus-erigon"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "nyc3"}
        "3" = {}
      }
    },
    // Teku combos
    {
      id = "teku-geth"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "blr1"}
        "5" = {region = "blr1"}
        "6" = {region = "blr1"}
        "7" = {region = "blr1"}
        "8" = {region = "blr1"}
        "9" = {region = "blr1"}
        "10" = {region = "nyc3"}
        "11" = {region = "nyc3"}
        "12" = {region = "nyc3"}
        "13" = {region = "nyc3"}
        "14" = {region = "nyc3"}
        "15" = {region = "nyc3"}
        "16" = {region = "nyc3"}
        "17" = {region = "nyc3"}
        "18" = {region = "nyc3"}
        "19" = {region = "nyc3"}
        "20" = {region = "nyc3"}
        "21" = {region = "nyc3"}
        "22" = {region = "nyc3"}
        "23" = {}
        "24" = {}
        "25" = {}
        "26" = {}
        "27" = {}
        "28" = {}
        "29" = {}
        "30" = {}
      }
    },
    {
      id = "teku-besu"
      vms = {
        "1" = { region = "blr1",size = "m-4vcpu-32gb" }
        "2" = { region = "blr1",size = "m-4vcpu-32gb" }
        "3" = { region = "nyc3",size = "m-4vcpu-32gb" }
        "4" = { region = "nyc3",size = "m-4vcpu-32gb" }
        "5" = { size = "m-4vcpu-32gb" }
        "6" = { size = "m-4vcpu-32gb" }
      },
    },
    {
      id = "teku-nethermind"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "blr1"}
        "5" = {region = "nyc3"}
        "6" = {region = "nyc3"}
        "7" = {region = "nyc3"}
        "8" = {}
        "9" = {}
      }
    },
    {
      id = "teku-erigon"
      vms = {
        "1" = {region = "blr1"}
        "2" = {region = "blr1"}
        "3" = {region = "blr1"}
        "4" = {region = "nyc3"}
        "5" = {region = "nyc3"}
        "6" = {}
      }
    },
  ]
}

////////////////////////////////////////////////////////////////////////////////////////
//                                        LOCALS
////////////////////////////////////////////////////////////////////////////////////////


locals {
  digitalocean_default_region = "ams3"
  digitalocean_default_size   = "gd-4vcpu-16gb"
  digitalocean_default_image  = "debian-11-x64"
  digitalocean_global_tags = [
    "Owner:Devops",
    "EthNetwork:${var.ethereum_network}"
  ]

  # flatten vm_groups so that we can use it with for_each()
  digitalocean_vms = flatten([
    for group in var.digitalocean_vm_groups : [
      for vm_key, vm in group.vms : {
        id        = "${group.id}.${vm_key}"
        group_key = group.id
        vm_key    = vm_key

        name        = try(vm.name, "${group.id}-${vm_key}")
        ssh_keys    = try(vm.ssh_keys, [data.digitalocean_ssh_key.main.fingerprint])
        region      = try(vm.region, try(group.region, local.digitalocean_default_region))
        image       = try(vm.image, local.digitalocean_default_image)
        size        = try(vm.size, local.digitalocean_default_size)
        resize_disk = try(vm.resize_disk, true)
        monitoring  = try(vm.monitoring, true)
        backups     = try(vm.backups, false)
        ipv6        = try(vm.ipv6, false)
        vpc_uuid = try(vm.vpc_uuid, try(
          digitalocean_vpc.main[vm.region].id,
          digitalocean_vpc.main[try(group.region, local.digitalocean_default_region)].id
        ))

        tags = concat(local.digitalocean_global_tags, try(split(",", group.tags), []), try(split(",", vm.tags), []))
      }
    ]
  ])

}

////////////////////////////////////////////////////////////////////////////////////////
//                                  DIGITALOCEAN RESOURCES
////////////////////////////////////////////////////////////////////////////////////////
data "digitalocean_project" "main" {
  name = var.digitalocean_project_name
}

data "digitalocean_ssh_key" "main" {
  name = var.digitalocean_ssh_key_name
}

resource "digitalocean_vpc" "main" {
  for_each = var.digitalocean_vpcs
  name     = try(each.value.name, "${var.ethereum_network}-${each.key}")
  region   = each.key
  ip_range = each.value.ip_range
}

resource "digitalocean_droplet" "main" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  name        = each.value.name
  region      = each.value.region
  ssh_keys    = each.value.ssh_keys
  image       = each.value.image
  size        = each.value.size
  resize_disk = each.value.resize_disk
  monitoring  = each.value.monitoring
  backups     = each.value.backups
  ipv6        = each.value.ipv6
  vpc_uuid    = each.value.vpc_uuid
  tags        = each.value.tags
}

resource "digitalocean_project_resources" "droplets" {
  for_each  = digitalocean_droplet.main
  project   = data.digitalocean_project.main.id
  resources = [each.value.urn]
}

resource "digitalocean_firewall" "main" {
  name = "${var.ethereum_network}-nodes"
  // Tags are used to select which droplets should
  // be assigned to this firewall.
  tags = [
    "EthNetwork:${var.ethereum_network}"
  ]

  // SSH
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  // Nginx / Web
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  // Consensus layer p2p port
  inbound_rule {
    protocol         = "tcp"
    port_range       = "9000-9001"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "udp"
    port_range       = "9000-9001"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  // Execution layer p2p Port
  inbound_rule {
    protocol         = "tcp"
    port_range       = "30303"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "udp"
    port_range       = "30303"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  // Allow all outbound traffic
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

////////////////////////////////////////////////////////////////////////////////////////
//                                   DNS NAMES
////////////////////////////////////////////////////////////////////////////////////////

data "cloudflare_zone" "default" {
  name = "ethpandaops.io"
}

resource "cloudflare_record" "server_record" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  zone_id = data.cloudflare_zone.default.id
  name    = "${each.value.name}.srv.${var.ethereum_network}"
  type    = "A"
  value   = digitalocean_droplet.main[each.value.id].ipv4_address
  proxied = false
  ttl     = 120
}

resource "cloudflare_record" "server_record_rpc" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  zone_id = data.cloudflare_zone.default.id
  name    = "rpc.${each.value.name}.srv.${var.ethereum_network}"
  type    = "A"
  value   = digitalocean_droplet.main[each.value.id].ipv4_address
  proxied = false
  ttl     = 120
}

resource "cloudflare_record" "server_record_beacon" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  zone_id = data.cloudflare_zone.default.id
  name    = "bn.${each.value.name}.srv.${var.ethereum_network}"
  type    = "A"
  value   = digitalocean_droplet.main[each.value.id].ipv4_address
  proxied = false
  ttl     = 120
}

////////////////////////////////////////////////////////////////////////////////////////
//                          GENERATED FILES AND OUTPUTS
////////////////////////////////////////////////////////////////////////////////////////

resource "local_file" "ansible_inventory" {
  content = templatefile("ansible_inventory.tmpl",
    {
      ethereum_network_name = "${var.ethereum_network}"
      groups = merge(
        { for group in var.digitalocean_vm_groups : "${group.id}" => true },
      )
      hosts = merge(
        {
          for key, server in digitalocean_droplet.main : "do.${key}" => {
            ip       = "${server.ipv4_address}"
            group    = split(".", key)[0]
            tags     = "${server.tags}"
            hostname = "${split(".", key)[0]}-${split(".", key)[1]}"
            cloud    = "digitalocean"
            region   = "${server.region}"
          }
        }
      )
    }
  )
  filename = "../../../ansible/inventories/testing-devnet/inventory.ini"
}
