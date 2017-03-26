class ntp::params {

    case $facts['os']['family']{
	  'redhat': {
	    $ntp_service = 'ntpd'
	    $admingroup = 'wheel'
	   }
	  'debian': {
	    $ntp_service = 'ntp'
	    $admingroup = 'sudo'
	   }
	   default: {
	     fail("FAILED: ${facts['os']['family']} is not supported!")
	   }  
	}
}
