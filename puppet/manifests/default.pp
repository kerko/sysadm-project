# Puppet Manifest for Web Development Tools

# Browsers
$tools = ["git" , "ruby", "python"]
package { $tools: ensure => "installed" }

package { 'firefox':
  ensure => 'latest'
}
include googlechrome
#  ::firefox{"firefox":}
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
