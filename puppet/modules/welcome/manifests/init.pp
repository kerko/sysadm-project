#
# == Class: welcome
    #
    # Module to create a welcome html page with user informations
    #
    # === Examples
    #
    # include welcome
    #
    # === Authors
    #
    # Urs Oberdorf <urs.oberdorf@hig.no>
    #
    # === Copyright
    #
    # Copyright 2014 Urs Oberdorf.
    #
class welcome (
  $mode                   = '0755',
  $welcomePage_path       = '/home/vagrant/src/index.html',
  $welcomePage_template   = 'welcome/welcomePage.html',

  $welcomeScript_path     = '/home/vagrant/Desktop/welcome.sh',
  $welcomeScript_template = 'welcome/welcomeScript.sh',
) {

  file { '/home/vagrant/src':
    ensure => directory,
    mode   => $mode,
  }

  file { $welcomePage_path:
    ensure  => present,
    content => template($welcomePage_template),
    mode    => $mode,
    require => FILE['/home/vagrant/src'],
  }

  file { $welcomeScript_path:
    ensure  => present,
    content => template($welcomeScript_template),
    mode    => $mode,
  }
}
