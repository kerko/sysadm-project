# == Class: sublime
    #
    # Module to add a repository that contains Sublime 3 to ubuntu 14.04 and
    # install the latest version of Sublime.
    #
    # === Examples
    #
    # include sublime
    #
    # === Authors
    #
    # Jan Kerkenhoff <jan.kerkenhoff@gmail.com>
    #
    # === Copyright
    #
    # Copyright 2014 Jan Kerkenhoff.
    #
class sublime {
  include apt

  apt::ppa { 'ppa:webupd8team/sublime-text-3': }

  package{'sublime-text-installer':
    ensure  => latest,
    require => Apt::Ppa['ppa:webupd8team/sublime-text-3']
  }
}
