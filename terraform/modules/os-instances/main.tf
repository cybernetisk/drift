/*
	All OpenStack instance resources for CYB
*/

variable "image" {
	type = string
	description = "Image to use for instances"
}

variable "flavors" {
	type = map(string)
	description = "Flavor names to use for instances"
}

variable "keypair" {
	type = string
	description = "Keypair name ID to use for instances"
}

variable "security_groups" {
	type = map(string)
	description = "Security group IDs for instances"
}

variable "network" {
	type = string
	description = "Network name for instances"
}

# Create application server for Confluence
resource "openstack_compute_instance_v2" "first-confluence" {
	name = "core-confluence"
	image_name = "${var.image}"
	flavor_name = "${var.flavors.large}"
	network {
		name = var.network
	}
	security_groups = [
		var.security_groups.web,
		var.security_groups.minion
	]
	key_pair = var.keypair

	user_data = "${file("coreos/cyb.ign")}"
}

# Create application server for Jira
resource "openstack_compute_instance_v2" "first-jira" {
	name = "core-jira"
	image_name = "${var.image}"
	flavor_name = "${var.flavors.medium}"
	network {
		name = var.network
	}
	security_groups = [
		var.security_groups.web,
		var.security_groups.minion
	]
	key_pair = var.keypair

	user_data = "${file("coreos/cyb.ign")}"
}

# Create application server for Crowd
resource "openstack_compute_instance_v2" "first-crowd" {
	name = "core-crowd"
	image_name = "${var.image}"
	flavor_name = "${var.flavors.small}"
	network {
		name = var.network
	}
	security_groups = [
		var.security_groups.web,
		var.security_groups.minion
	]
	key_pair = var.keypair

	user_data = "${file("coreos/cyb.ign")}"
}

# Create some database servers; we'll need too, and not much memory either
resource "openstack_compute_instance_v2" "core-db" {
	count = 2
	name = "${format("core-db%02d", count.index + 1)}"
	image_name = "${var.image}"
	flavor_name = "${var.flavors.small}"
	network {
		name = var.network
	}
	security_groups = [
		var.security_groups.minion,
		var.security_groups.db
	]
	key_pair = var.keypair

	user_data = "${file("coreos/cyb.ign")}"
}

/*
	Outputs for magic
*/
output "public_ips" {
	value = {
		"confluence" = openstack_compute_instance_v2.first-confluence.access_ip_v4
		"jira" = openstack_compute_instance_v2.first-jira.access_ip_v4
		"crowd" = openstack_compute_instance_v2.first-crowd.access_ip_v4
	}
}
