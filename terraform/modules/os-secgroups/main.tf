/* 
	Security groups and rules
*/
locals {
  groups = {
    "web" = {
      name        = "role-web"
      description = "HTTP & HTTPS"
    }
    "minion" = {
      name        = "role-minion"
      description = "SSH, SaltStack, CoreOS stuff, common areas"
    }
    "db" = {
      name        = "role-db"
      description = "Database access, PostgreSQL, etc."
    }
  }
}

resource "openstack_networking_secgroup_v2" "groups" {
  for_each    = local.groups
  name        = each.value.name
  description = each.value.description
}

resource "openstack_networking_secgroup_rule_v2" "ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.groups["minion"].id
}

resource "openstack_networking_secgroup_rule_v2" "http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.groups["web"].id
}

resource "openstack_networking_secgroup_rule_v2" "https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.groups["web"].id
}

resource "openstack_networking_secgroup_rule_v2" "psql" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5432
  port_range_max    = 5432
  remote_group_id   = openstack_networking_secgroup_v2.groups["minion"].id
  security_group_id = openstack_networking_secgroup_v2.groups["db"].id
}

output "groups" {
  value       = openstack_networking_secgroup_v2.groups
  description = "ID of security groups attached"
}
