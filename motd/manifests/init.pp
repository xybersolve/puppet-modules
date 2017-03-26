class motd ( $message = 'Daily' ) {

  $allowed = [
    '^Weekly$',
    '^Daily$',
  ]

  # validate_re($message, $allowed, "An invalid message file was provided: ${message}.")
  validate_re($message, $allowed)

  file { '/etc/motd' :
    ensure  => present,
    content => file("motd/${message}"),
  }
}

