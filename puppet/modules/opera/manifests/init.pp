## Install the opera browser in Ubunut 14.04
#class opera (
#  $dest_file_key = '/tmp/opera_key',
#  $url_key = 'http://deb.opera.com/archive.key',
#  $url_repo = 'http://deb.opera.com/opera/ stable non-free',
#  $sources_file = '/etc/apt/sources.list.d/opera.list'
#) {
#  # Get the Key 
#  exec { "get_key_opera":
#    command => "wget -q -O ${dest_file_key} ${url_key}",
#    path => $::path,
#    creates => "${dest_file_key}"
#  }
#  
#  # Install the key
#  exec { "install_key_opera":
#    command => "apt-key add ${dest_file_key}",
#    path => $::path,
#    require => EXEC['get_key_opera'],
#    unless => "apt-key list | grep Opera"
#  }
#  
#  # Add repository
#  exec { "add_repository_opera":
#    command => "echo \"deb ${url_repo}\" >> ${sources_file}",
#    path => $::path,
#    unless => "grep ${url_repo} ${sources_file}"
#  }
#  
#  # Update repository list
#  exec { "update_repository_opera":
#    command => "apt-get update",
#    path => $::path,
#    require => EXEC['install_key_opera', 'add_repository_opera'],
#  }
#
#  package { 'opera':
#    ensure => 'latest',
#    require => EXEC['update_repository_opera'],
#  }
#}
################################################################################
#
#Install Opera Bowser with the puppet apt module
class opera (
  $url_key = 'http://deb.opera.com/archive.key',
  $url_repo = 'http://deb.opera.com/opera/',
){
  include apt

  apt_key { 'opera_key':
    source => $url_key,
    # Last 8 digits of Fingerprint
    id => 'A8492E35',
    ensure => 'present',
  }

  apt::source { 'opera_repository':
    location => $url_repo,
    release => 'stable',
    repos => 'non-free',
    include_src => false,
  }

  package { 'opera':
    ensure => 'latest',
    require => [
                APT_KEY['opera_key'],
                APT::SOURCE['opera_repository'],
               ],
  }
}
