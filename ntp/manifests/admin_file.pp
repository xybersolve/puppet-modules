# Puppet defined type: admin_file
define ntp::admin_file ( $ntp_location = 'london' ) {
  include ntp::params
  $admingroup = $ntp::params::admingroup
  file { $title :
    content => file('ntp/ntp.conf'),
    owner   => 'root',
    group   => $admingroup,
    mode    => '0664',
    ensure  => 'file',
    notify  => Class['ntp::service'],
  }
}

