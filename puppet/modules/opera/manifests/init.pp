#Install Opera Bowser with the puppet apt module
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
