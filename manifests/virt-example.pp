class xen-fullvirt-guest {
	virt { "Jun29":
		ensure => installed,
		memory => 512,
		virt_path => "/home/carla/ourgrid/images/worker-carla/disk0.qcow2",
		virt_type => "xen_fullyvirt"
	}
}

class ovz-guest {
	virt { "101":
		ensure => installed,
		memory => 1024,
    vcpu => 4,
    xml_file => "/etc/libvirt/qemu/systems/101.xml",
		tmpl_cache => "debian-5.0-x86",
		virt_type => "openvz"
	}
}
