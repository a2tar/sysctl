class sysctl {
	file { "sysctl.conf":
		name => $operatingsystem ? {
			default => "/etc/sysctl.conf",
		},
	}

	exec { "sysctl -p":
		alias => "sysctl",
		refreshonly => true,
		subscribe => File["sysctl.conf"],
                path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin",
	}
}
