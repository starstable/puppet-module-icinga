# == Class: icinga::client::packages
#
# Installs all the client side stuff we need to monitor a host.
#
# === Authors
#
# Nedap Steppingstone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Steppingstone.
#
class icinga::client::packages (
  $p_nagios_nrpe               = $::icinga::client::package_nagios_nrpe_server,
  $p_nagios_plugins            = $::icinga::client::package_nagios_plugins,
  $p_nagios_plugins_all        = $::icinga::client::package_nagios_plugins_all,
) {

  package { $p_nagios_nrpe_server:
    ensure => latest,
    notify => Class['icinga::client::services'],
  }

  package { [
    $p_nagios_plugins,
    $p_nagios_plugins_all,
  ]:
    ensure  => latest,
  }

}
