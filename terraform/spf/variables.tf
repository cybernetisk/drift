variable "image_name" {
	default = "GOLD Fedora 31"
	description = "Image to use for SPF worker node"
}
variable "security_groups" {
	description = "Security groups"
}
variable "key_pair" {
	type = string
	description = "Existing OpenStack key pair to use for instance"
}
