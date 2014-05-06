class sysctl {
	file { "sysctl.conf":
		name => $operatingsystem ? {
			default => "/etc/sysctl.conf",
		},
	}

	exec { "/sbin/sysctl -p":
		alias => "sysctl",
		refreshonly => true,
		subscribe => File["sysctl.conf"],
	}
}
