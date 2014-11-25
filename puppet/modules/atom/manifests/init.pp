# Install the WebUpd8 Repository and specified Packages in Ubunut 14.04
class atom {
  include apt

  apt::ppa { 'ppa:webupd8team/atom': }

  package{'atom':
    ensure  => latest,
    require => Apt::Ppa['ppa:webupd8team/atom']
  }
}
