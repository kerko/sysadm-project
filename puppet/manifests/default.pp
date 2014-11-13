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

## apache docker container

#docker::image{'php':
#image_tag => 'apache'
#}
## mysql docker container
#docker::image{'mysql:'}
