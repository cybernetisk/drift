provider "openstack" {

}

# SPF-instance too
# NOTE: Different Ignition container file
resource "openstack_compute_instance_v2" "spf-worker" {
	name = "spf"
	image_name = var.image_name
	flavor_name = "m1.small"
	network {
		name = "dualStack"
	}
	security_groups = [
		var.security_groups["minion"].id,
		var.security_groups["web"].id
	]
	key_pair = var.key_pair
	#user_data = "${file("coreos/spf.ign")}"
}

output "ip" {
	value = openstack_compute_instance_v2.spf-worker.access_ip_v4
}
