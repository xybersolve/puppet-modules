class ntp::config ( 
    $location = 'nyc',
    $admingroup = $ntp::params::admingroup,
) inherits ntp::params {
    
    $allowed_locations = [
      '^nyc$',
      '^paris$',
      '^london$',
    ]

    validate_re($location, $allowed_locations)

    # use the Defined Type: admin_file.pp
    ntp::admin_file { '/etc/ntp.conf': } 

    # File {
    #  ensure => 'file',
    #  owner  => 'root',
    #  group  => $admingroup,
    #  mode   => '0664',
    #}
	
    #file { '/etc/ntp.conf':
    #  content => file("ntp/${location}"), 
    #  notify  => Class['ntp::service'],
    #}
} 
