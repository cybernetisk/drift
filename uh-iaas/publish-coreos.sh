
if [ -z ${OS_USERNAME+x} ]; then
	echo "ERROR: You need to source keystone.sh first" >&2
	exit 1
fi


# Download latest
wget https://stable.release.core-os.net/amd64-usr/current/coreos_production_openstack_image.img.bz2 -O coreos_production_openstack_image.img.bz2

# Unzip that shit
bunzip2 coreos_production_openstack_image.img.bz2

# Upload away
glance image-create --name Container-Linux \
  --container-format bare \
  --disk-format qcow2 \
  --file coreos_production_openstack_image.img

