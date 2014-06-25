# == Class: icinga::server::services
#
# Manages the Icinga daemon.
#
# === Authors
#
# Nedap Steppingstone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Steppingstone.
#
class icinga::server::services(
  $s_icinga =  $::icinga::server::service_icinga,
  $s_ido2db =  $::icinga::server::service_ido2db,
){

  service { $s_icinga:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    restart    => "service ${s_icinga} reload",
    hasstatus  => true,
  }
  
  service { $s_ido2db:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    restart    => "service ${s_ido2db} restart",
    hasstatus  => true,
  }
}
