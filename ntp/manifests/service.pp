class ntp::service (
  $ntp_service = $ntp::params::ntp_service,
) inherits ntp::params {
    
     notify { "ntp::service-\$ntp_service: ${ntp_service}":}

	service { 'NTPService':
	  ensure => 'running',
	  enable => true,
	  name      => $ntp_service,
	  subscribe => Class['ntp::config'],
	}
}
