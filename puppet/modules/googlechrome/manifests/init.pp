# Install the google chrome stable browser in Ubunut 14.04
class googlechrome (
  $dest_file_key = '/tmp/google_key',
  $url_key = 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
  $url_repo = 'http://dl.google.com/linux/chrome/deb/ stable main',
  $sources_file = '/etc/apt/sources.list.d/google-chrome.list'
) {
  # Get the Key
  exec { "get_key_chrome":
    command => "wget -q -O ${dest_file_key} ${url_key}",
    path => $::path,
    creates => "${dest_file_key}"
  }

  # Install the key
  exec { "install_key_chrome":
    command => "apt-key add ${dest_file_key}",
    path => $::path,
    require => EXEC['get_key_chrome'],
    unless => "apt-key list | grep Google"
  }

  # Add repository
  exec { "add_repository_chrome":
    command => "echo \"deb ${url_repo}\" >> ${sources_file}",
    path => $::path,
    unless => "grep \"${url_repo}\" ${sources_file}"
  }

  # Update repository list
  exec { "update_repository_chrome":
    command => "apt-get update",
    path => $::path,
    require => EXEC['install_key_chrome', 'add_repository_chrome'],
  }

  package { 'google-chrome-stable':
    ensure => 'latest',
    require => EXEC['update_repository_chrome'],
  }
}
