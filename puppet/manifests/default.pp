# Puppet Manifest for Web Development Tools

# Tools
$tools = ["git" , "ruby", "python"]
package { $tools: ensure => "latest" }

#Editors
package { 'vim': ensure => 'latest' }
include atom
include sublime

# Browsers
include googlechrome
include opera
package { 'firefox':
  ensure => 'latest'
}
# Think about firefox nightly builds and other bleeding edge browser builds

#### Add Docker and Containers
####

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
