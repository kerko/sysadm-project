# Puppet Manifest for Web Development Tools

# Tools
$tools = ['git' , 'ruby', 'python', 'wireshark', 'filezilla', 'mysql-workbench','mysql-client']
package { $tools: ensure => 'latest' }

#Editors
package { 'vim': ensure => 'latest' }
include atom
include sublime

include googlechrome
# Browsers
package { 'firefox':
  ensure => 'latest'
}

include googlechrome
include opera


#### Add Docker and Containers ####

include docker


## apache docker container

docker::image{'php':
image_tag => 'apache',
require => CLASS['docker'],
}
## mysql docker container
docker::image{'mysql':
  require => CLASS['docker']
}

docker::run { 'mysql':
  image => 'mysql',
  use_name => true,
  # Must be set, otherwise SQL server wont run
  env => 'MYSQL_ROOT_PASSWORD=abc'
}
->
docker::run { 'webServer':
  image => 'php:apache',
  use_name => true,
  ports => '80',
  expose => '80',
  links => ['mysql:db'],
  volumes => '/var/www',
}
