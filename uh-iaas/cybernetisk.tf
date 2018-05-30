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
variable "coreos" {
	default     = "Container-Linux"
	description = "Name for CoreOS container image"
}
# Compute flavours together with UH-IaaS
resource "openstack_compute_keypair_v2" "cyb" {
	name        = "drift"
	public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/Lab1LgjwUVbXDUCQctUa1/7r7mLRwaTsWMmsvKrc9+CKPmgpR6d2x9z4/vVCFbRs2ZECsQPdNVTFr/kKLFcEFy3ITSteOFXb1hX1csD1Ktcu+Bh4PdSe/d0tDudJPKx8VimcXrd/o90A+mn/u+S+O2xMyx5YI2179hTqH/6mkUs/AEtg6C9RaMH1QNrZIQAbcnrinCnRz+mfH8+m/ZawMTvOQ2pUk7tIiTk1xzAgojzmSDM+2leqNbM97LImX/k7ADOiqlvMe3+q+nn8UQe1+qEAMeIWiwTDaWAuZpx71f4TmEbVlx1ZJ1XCzulDQgQbabT2J02FtEr/zr4apbWl3PMyMrxL5u30qqo7Dx6BcZo7Ekjowo5awAXtnz83XtHGvyfXRvVb3l+6d1RpnzDS5ecLIpX/ATrtUA+HBWYch+RXi0Wkc+ppUdvnVsCyal5blHvPathpWbwcKwX3jVqayoOyGcpCNOduAXxDJorAvdgUmFtqYclfhpAdjkegyaCsZ3uFxYphXW6YAg72qCo57NgKa4bU+SzVSUfyoqktHUqyD/PnYMKcUlAx6vUXjARDPeGL/7fyJ5+63mzRMit7XrdsKv7Ps1U+c7HlNTrvTVfyD6Tw3NzEYbSRTCMNaCGUiIdjFeRebw6tTGPHctLXpLVGif8wXFBr+7uYfiyLFw== drift@cyb.no"
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

/* 
Security groups and rules
*/
resource "openstack_networking_secgroup_v2" "web" {
	name = "role-web"
	description = "HTTP & HTTPS"
}

resource "openstack_networking_secgroup_v2" "minion" {
	name = "role-minion"
	description = "SSH, SaltStack, CoreOS stuff, common areas"
}

resource "openstack_networking_secgroup_v2" "db" {
	name = "role-db"
	description = "Database access, PostgreSQL, etc."
}

resource "openstack_networking_secgroup_rule_v2" "http" {
	direction         = "ingress"
	ethertype         = "IPv4"
	protocol          = "tcp"
	port_range_min    = 80
	port_range_max    = 80
	remote_ip_prefix  = "0.0.0.0/0"
	security_group_id = "${openstack_networking_secgroup_v2.web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "ssh" {
	direction         = "ingress"
	ethertype         = "IPv4"
	protocol          = "tcp"
	port_range_min    = 22
	port_range_max    = 22
	remote_ip_prefix  = "0.0.0.0/0"
	security_group_id = "${openstack_networking_secgroup_v2.minion.id}"
}


resource "openstack_networking_secgroup_rule_v2" "https" {
	direction         = "ingress"
	ethertype         = "IPv4"
	protocol          = "tcp"
	port_range_min    = 443
	port_range_max    = 443
	remote_ip_prefix  = "0.0.0.0/0"
	security_group_id = "${openstack_networking_secgroup_v2.web.id}"
}

resource "openstack_networking_secgroup_rule_v2" "psql" {
	direction         = "ingress"
	ethertype         = "IPv4"
	protocol          = "tcp"
	port_range_min    = 5432
	port_range_max    = 5432
	remote_group_id   = "${openstack_networking_secgroup_v2.minion.id}"
	security_group_id = "${openstack_networking_secgroup_v2.db.id}"
}

# Temporarily disabled: multiple endpoints discovered; use variable.
#resource "openstack_images_image_v2" "coreos" {
	#	name = "Container-Linux"
	#	disk_format = "qcow2"
	#	container_format = "bare"
	#	local_file_path = "coreos_production_openstack_image.img"
	#	region = "osl"
	#}

	/*
	All compute resources for CYB
	*/
	# Create application server for Confluence
	resource "openstack_compute_instance_v2" "first-confluence" {
		name = "core-confluence"
		image_name = "${var.coreos}"
		flavor_name = "${data.openstack_compute_flavor_v2.large.name}"
		network {
			name = "${data.openstack_networking_network_v2.public.name}"
		}
		security_groups = [
			"${openstack_networking_secgroup_v2.web.name}",
			"${openstack_networking_secgroup_v2.minion.name}"
		]
		key_pair = "${openstack_compute_keypair_v2.cyb.name}"

		user_data = "${file("coreos/cyb.ign")}"
	}

	# Create application server for Jira
	resource "openstack_compute_instance_v2" "first-jira" {
		name = "core-jira"
		image_name = "${var.coreos}"
		flavor_name = "${data.openstack_compute_flavor_v2.medium.name}"
		network {
			name = "${data.openstack_networking_network_v2.public.name}"
		}
		security_groups = [
			"${openstack_networking_secgroup_v2.web.name}",
			"${openstack_networking_secgroup_v2.minion.name}"
		]
		key_pair = "${openstack_compute_keypair_v2.cyb.name}"

		user_data = "${file("coreos/cyb.ign")}"
	}

	# Create application server for Crowd
	resource "openstack_compute_instance_v2" "first-crowd" {
		name = "core-crowd"
		image_name = "${var.coreos}"
		flavor_name = "${data.openstack_compute_flavor_v2.small.name}"
		network {
			name = "${data.openstack_networking_network_v2.public.name}"
		}
		security_groups = [
			"${openstack_networking_secgroup_v2.web.name}",
			"${openstack_networking_secgroup_v2.minion.name}"
		]
		key_pair = "${openstack_compute_keypair_v2.cyb.name}"

		user_data = "${file("coreos/cyb.ign")}"
	}

	# Create some database servers; we'll need too, and not much memory either
	resource "openstack_compute_instance_v2" "core-db" {
		count = 2
		name = "${format("core-db%02d", count.index + 1)}"
		image_name = "${var.coreos}"
		flavor_name = "${data.openstack_compute_flavor_v2.small.name}"
		network {
			name = "${data.openstack_networking_network_v2.public.name}"
		}
		security_groups = [
			"${openstack_networking_secgroup_v2.minion.name}",
			"${openstack_networking_secgroup_v2.db.name}"
		]
		key_pair = "${openstack_compute_keypair_v2.cyb.name}"

		user_data = "${file("coreos/cyb.ign")}"
	}

	# SPF-instance too
	# NOTE: Different Ignition container file
	resource "openstack_compute_instance_v2" "core-spf" {
		name = "spf"
		image_name = "${var.coreos}"
		flavor_name = "${data.openstack_compute_flavor_v2.small.name}"
		network {
			name = "${data.openstack_networking_network_v2.public.name}"
		}
		security_groups = [
			"${openstack_networking_secgroup_v2.minion.name}"
		]
		key_pair = "${openstack_compute_keypair_v2.cyb.name}"

		user_data = "${file("coreos/spf.ign")}"
	}

	/*
	Outputs for magic
	*/
	output "confluence_ip" {
		value = "${openstack_compute_instance_v2.first-confluence.access_ip_v4}"
	}
	output "jira_ip" {
		value = "${openstack_compute_instance_v2.first-jira.access_ip_v4}"
	}
	output "crowd_ip" {
		value = "${openstack_compute_instance_v2.first-crowd.access_ip_v4}"
	}
	output "db_ips" {
		value = ["${openstack_compute_instance_v2.core-db.*.access_ip_v4}"]
	}
