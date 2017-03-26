class ntp::config ( $location = 'nyc' ){
    
    $allowed_locations = [
      '^nyc$',
      '^paris$',
      '^london$',
    ]

    validate_re($location, $allowed_locations)

	case $facts['os']['family']{
	  'redhat': {
	    $admingroup = 'wheel'
	   }
	  'debian': {
	    $admingroup = 'sudo'
	   }
	   default: {
	     fail("FAILED: ${facts['os']['family']} is not supported!")
	   }  
	}

    File {
	  ensure => 'file',
	  owner  => 'root',
	  group  => $admingroup,
	  mode   => '0664',
	}
	
	file { '/etc/ntp.conf':
	  content => file("ntp/${location}"), 
	  notify  => Class['ntp::service'],
	}
} 
