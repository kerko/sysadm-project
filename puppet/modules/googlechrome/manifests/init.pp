# Install the google chrome stable browser in Ubunut 14.04
class googlechrome (
  $dest_file_key_google = '/tmp/google_key',
  $url_key = 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
  $url_repo = 'http://dl.google.com/linux/chrome/deb/ stable main',
  $sources_file = '/etc/apt/sources.list.d/google-chrome.list'
) {
  # Get the Key from google
  exec { "get_key_google":
    command => "wget -q -O ${dest_file_key_google} ${url_key}",
    path => $::path,
  }
  
  # Install the key
  exec { "install_key_google":
    command => "apt-key add ${dest_file_key_google}",
    path => $::path,
    require => EXEC['get_key_google'],
  }
  
  # Add googles repository
  exec { "add_repository":
    command => "echo \"deb ${url_repo}\" >> ${sources_file}",
    path => $::path,
    #onlyif => 
  }
  
  # Update repository list
  exec { "update_repository":
    command => "apt-get update",
    path => $::path,
    require => EXEC['install_key_google', 'add_repository'],
  }

  package { 'google-chrome-stable':
    ensure => 'latest',
    require => EXEC['update_repository'],
  }
}
