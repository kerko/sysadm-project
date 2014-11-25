# == Class: opera
    #
    # Module to add a repository that contains Opera to ubuntu 14.04 and
    # install the latest version of Opera.
    #
    # === Examples
    #
    # include opera
    #
    # === Authors
    #
    # Urs Oberdorf <urs.oberdorf@hig.no>
    #
    # === Copyright
    #
    # Copyright 2014 Urs Oberdorf.
    #
class opera (
  $url_key  = 'http://deb.opera.com/archive.key',
  $url_repo = 'http://deb.opera.com/opera/',
){
  include apt

  apt_key { 'opera_key':
    ensure => 'present',
    source => $url_key,
    id     => 'A8492E35',  # Last 8 digits of Fingerprint
  }

  apt::source { 'opera_repository':
    location    => $url_repo,
    release     => 'stable',
    repos       => 'non-free',
    include_src => false,
  }

  package { 'opera':
    ensure  => 'latest',
    require => [
                APT_KEY['opera_key'],
                APT::SOURCE['opera_repository'],
               ],
  }
}
