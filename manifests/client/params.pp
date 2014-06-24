# == Class: icinga::client::params
#
# Client-side configuration parameters for Icinga.
#
# === Authors
#
# Nedap Steppingstone <steppingstone@nedap.com>
#
# === Copyright
#
# Copyright 2012, 2013 Nedap Steppingstone.
#
class icinga::client::params {
  case $::osfamily {
    'RedHat': {
      $package_nagios_nrpe                = 'nrpe'
      $package_nagios_plugins             = 'nagios-plugins'
      $package_nagios_plugins_all         = 'nagios-plugins-all'
      $service_nagios_nrpe                = 'nrpe'
      $service_nagios_nrpe_pattern        = 'nrpe'
      $dir_nagios                         = '/etc/nagios'
      $dir_nrpe                           = "${dir_nagios}/nrpe.d"
      $file_nrpe_config                   = "${dir_nagios}/nrpe.cfg"
      $dir_nagios_lib                     = '/usr/lib64/nagios'
      $dir_nagios_plugins                 = "${dir_nagios_lib}/plugins"

      # params below should equal ::icinga::server::params::$param
      $dir_icinga                         = '/etc/icinga'
      $dir_objects                        = "${dir_icinga}/objects"

      # nrpe.fg
      $log_facility           = 'daemon'
      $pid_file               = '/var/run/nagios/nrpe.pid'
      $server_port            = 5666
      # default 127.0.0.1, but commented
      $server_address         = undef
      $nrpe_user              = 'nagios'
      $nrpe_group             = 'nagios'
      # allowed_hosts is not set because we use the icinga_servers
      # array for that
      $dont_blame_nrpe        = 0
      # default /usr/bin/sudo, but commented
      $command_prefix         = undef
      $debug                  = 0
      $command_timeout        = 60
      $connection_timeout     = 300
      # default 1, but commented
      $allow_weak_random_seed = undef
      $file_local_nrpe_config = "${dir_nagios}/nrpe_local.cfg"
      $include_dir            = $dir_nrpe
    }
    default: {
      fail("\$osfamily ${::osfamily} is not supported by the Icinga module.")
    }
  }
}
