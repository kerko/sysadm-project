# Install the WebUpd8 Repository and specified Packages in Ubunut 14.04
class sublime {
  include apt

  apt::ppa { 'ppa:webupd8team/sublime-text-3': }



  package{'sublime-text-installer':
  ensure => latest,
  require => Apt::Ppa['ppa:webupd8team/sublime-text-3']
  }


}
