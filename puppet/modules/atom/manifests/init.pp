# == Class: atom
    #
    # Module to add a repository that contains atom to ubuntu and install the
    # latest version of Atom.
    #
    # === Examples
    #
    # include atom
    #
    # === Authors
    #
    # Jan Kerkenhoff <jan.kerkenhoff@gmail.com>
    #
    # === Copyright
    #
    # Copyright 2014 Jan Kerkenhoff.
    #
class atom {
  include apt

  apt::ppa { 'ppa:webupd8team/atom': }

  package{'atom':
    ensure  => latest,
    require => Apt::Ppa['ppa:webupd8team/atom']
  }
}
