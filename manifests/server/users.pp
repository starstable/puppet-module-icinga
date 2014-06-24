class icinga::server::users {
  user { 'icinga':
    ensure => present,
    system => true,
  }
}
