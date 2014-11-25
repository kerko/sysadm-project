# == Class: googlechrome
    #
    # Module to add a repository that contains Chrome to ubuntu 14.04 and
    # install the latest version of Chrome.
    #
    # === Examples
    #
    # include googlechrome
    #
    # === Authors
    #
    # Urs Oberdorf <urs.oberdorf@hig.no>
    #
    # === Copyright
    #
    # Copyright 2014 Urs Oberdorf.
    #
class googlechrome (
  $url_key  = 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
  $url_repo = 'http://dl.google.com/linux/chrome/deb/',
){
  include apt

  apt_key { 'googleChrome_key':
    ensure => 'present',
    source => $url_key,
    id     => '7FAC5991', # Last 8 digits of Fingerprint
  }

  apt::source { 'googleChrome_repository':
    location    => $url_repo,
    release     => 'stable',
    repos       => 'main',
    include_src => false,
  }

  package { 'google-chrome-stable':
    ensure  => 'latest',
    require => [
                APT_KEY['googleChrome_key'],
                APT::SOURCE['googleChrome_repository'],
               ],
  }
}
