
$tools = ["git" , "ruby", "python"]

package { $tools: ensure => "installed" }

include googlechrome
  ::firefox{"firefox":}

include opera




#### Add Docker and Containers
####

include docker

## apache docker container

docker::image{'php':
image_tag => 'apache'
}
## mysql docker container
#docker::image{'mysql:'}
