provider "openstack" {
# Username is gathered from OS_USERNAME
# Password is gathered from OS_PASSWORD
	alias				= "uh-iaas"
  tenant_name = "uio-stud-ii-cs"
  region      = "osl"
  auth_url    = "https://api.uh-iaas.no:5000/v3"
	domain_name = "dataporten"
	endpoint_type = "public"
# TODO: Bergen too, for the future
}

/* 
  Variables for use in compute resources
*/
# Compute flavours together with UH-IaaS
resource "openstack_compute_keypair_v2" "cyb" {
	name        = "cyb_drift"
	public_key  = var.public_key
}

data "openstack_networking_network_v2" "public" {
	name = "dualStack"
	network_id = "c97fa886-592e-4ad1-a995-6d55651bed78"
}


data "openstack_compute_flavor_v2" "small" {
	name = "m1.small"
}
data "openstack_compute_flavor_v2" "medium" {
	name = "m1.medium"
}
data "openstack_compute_flavor_v2" "large" {
	name = "m1.large"
}

module "os-secgroups" {
	source = "./modules/os-secgroups"
}

module "spf" {
	source = "./spf"
	key_pair = "cyb_drift"
	security_groups = module.os-secgroups.groups
}

#module "os-instances" {
#	source = "./modules/os-instances"
#
#	security_groups = {
#		"minion" = module.os-secgroups.minion
#		"web" = module.os-secgroups.web
#		"db" = module.os-secgroups.db
#	}
#	key_pair = "drift"
#	image = "Container-Linux"
#	flavors = {
#		"small" = "m1.small",
#		"medium" = "m1.medium",
#		"large" = "m1.large"
#	}
#	network = data.openstack_networking_network_v2.public.name
#}
