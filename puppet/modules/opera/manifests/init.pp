class opera {
  # installed required package
  package {"debian-archive-keyring":
  ensure => installed,
  before => Exec["echo \"deb http://deb.opera.com/opera/ stable non-free\" >> /etc/apt/sources.list.d/opera.list"]
    }
  #add repository to repolist
  exec {"deb http://deb.opera.com/opera/ stable non-free":
  ## add check if already present
  }
  ->
  exec {"wget -qO - http://deb.opera.com/archive.key | sudo apt-key add -":
  }
  ->
  exec {"sudo apt-get update":
  }
  ->
  package {"opera":
  ensure => latest,
  }
}
