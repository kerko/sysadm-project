# Puppet Manifest for Web Development Tools

# Tools
$tools = ["git" , "ruby", "python"]
package { $tools: ensure => "installed" }

# Browsers
package { 'firefox':
  ensure => 'latest'
}
include googlechrome
# Opera Repository currently broken (13.11.14)
#include opera




#### Add Docker and Containers
####

#include docker
#package { 'docker':
#  ensure => latest,
#}
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
  #ports => '80',
  #expose => '80',
  links => ['mysql:db'],
}
