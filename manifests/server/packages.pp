# == Class: icinga::server::packages
#
# Installs the Icinga server packages.
#
# === Authors
#
# Nedap Steppingstone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Steppingstone.
#
class icinga::server::packages (
  $p_nagios_nrpe_plugin = $::icinga::server::package_nrpe_plugin,
  $p_icinga             = $::icinga::server::package_icinga,
  $p_icinga_cgi         = $::icinga::server::package_icinga_cgi,
  $p_icinga_doc         = $::icinga::server::package_icinga_doc,
  $p_icinga_idoutils    = $::icinga::server::package_icinga_idoutils,
  $p_icinga_idoutils_db = $::icinga::server::package_icinga_idoutils_db,
) {

  package { $p_nagios_nrpe_plugin:
    ensure  => latest,
  }

  package { $p_nagios_images:
    ensure  => latest,
  }

  package { [
    $p_icinga,
    $p_icinga_cgi,
    $p_icinga_doc,
    $p_icinga_idoutils,
    $p_icinga_idoutils_db,
  ]:
    ensure  => latest,
    notify  => Class['icinga::server::services'],
  }

}
