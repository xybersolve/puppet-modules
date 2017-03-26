# Manage NTP on CentOS and Ubuntu Hosts
class ntp {
	
	package { 'ntp' :
	  before => Class['ntp::config'],
	}
    class { ntp::config :
      location => 'paris',
    }
    include ntp::service
 }

