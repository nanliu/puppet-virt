class virt {
	case $operatingsystem {
		debian: { include virt::debian }
		ubuntu: { include virt::ubuntu }
		fedora: { include virt::fedora }
	}
}

class virt::debian {
	case $virtual {
		kvm: {
			package {
				["kvm",
				"virt-manager",
				"libvirt",
				"libvirt-python",
				"python-virtinst",
				"qemu",
				"qemu-img",
				"qspice-libs"]:
					ensure => present,
			}
		}
		xen: {
			package {
				["linux-image-xen-686",
				"xen-hypervisor",
				"xen-tools",
				"xen-utils"]:
					ensure => present,
			}
		}
		openvzhn: {
			package {
				["linux-image-openvz-686",
				"vzctl",
				"vzquota",
				"vzdump",
				"libvirt-bin",
				"python-virtinst" ]:
					ensure => present;
			}
		}
	}
}

class virt::ubuntu {
	case $virtual {
		kvm: {
			package {
				["ubuntu-virt-server",
				"python-vm-builder",
				"kvm",
				"qemu",
				"qemu-kvm",
				"libvirt-ruby"]:
					ensure => present;
			}
		}
		xen: {
			package {
				["python-vm-builder",
				"ubuntu-xen-server",
				"libvirt-ruby"]:
					ensure => present;
			}
		}
		openvzhn: {
			package {
				["linux-openvz",
				"vzctl",
				"vzquota",
				"libvirt-bin",
				"python-virtinst"]:
					ensure => present;
			}
		}
	}
}

class virt::fedora {
	case $virtual {
		kvm: {
			package {
				["kvm",
				"qemu",
				"libvirt",
				"python-virtinst",
				"ruby-libvirt"]:
					ensure => present;
			}
		}
		xen: {
			package {
				["kernel-xen",
				"xen",
				"ruby-libvirt"]:
					ensure => present;
			}
		}
		openvzhn: {
			package {
				["ovzkernel",
				"vzctl",
				"vzquota",
				"libvirt",
				"python-virtinst",
				"ruby-libvirt"]:
					ensure => present;
			}
		}
	}
}

class virt::centos {
  case $virtual {
    kvm: {
      package {
        ["kvm",
        "qemu",
        "libvirt",
        "python-virtinst",
        "ruby-libvirt"]:
          ensure => present,
      }
    }
  }
}
