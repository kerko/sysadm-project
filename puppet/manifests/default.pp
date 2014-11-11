
$tools ["git" , "ruby", "python"]

package { $tools: ensure => "installed" }

include googlechrome
  ::firefox{"firefox":}

include opera
