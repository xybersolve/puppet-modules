class ntp::service {

	case $facts['os']['family']{
	  'redhat': {
	    $ntp_service = 'ntpd'
	   }
	  'debian': {
	    $ntp_service = 'ntp'
	   }
	   default: {
	     fail("FAILED: ${facts['os']['family']} is not supported!")
	   }  
	}
    
    Service {
	  ensure => 'running',
	  enable => true,
	}
	
	service { 'NTPService':
	  name      => $ntp_service,
	  subscribe => Class['ntp::config'],
	}
}
