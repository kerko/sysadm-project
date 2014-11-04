<<<<<<< HEAD
# Project Proposal
by Urs Oberdorf (141627) and Jan Kerkenhoff (141628)

## Building Development Environments using Docker and Vagrant


Our plan is to show how to use Vagrant to set up consistent development environments. We will show this for the case of web development. We also combine Vagrant with Docker to create a more production like environment, with separate instances and IP's for webserver, database and other services. Using Docker we minimize the performance impact of each development environment. Since we run docker containers instead of additional vm's for webserver and databases, we save valuable resources on the developers system. Because docker containers share resource with the host operating system they run on, it is possible to run more than one development environment at the same time.
Also vagrant reduces the effort to get the whole environment up and running to a single  `vagrant up` .


### We will provide an development environment with the following software:

* Chrome and Firefox
* git
* Atom as graphical editor
* optional Ruby or Python
* wireshark for debugging
* Additional tools needed for web development

  We need to research whats most common and should be included. Maybe define different tool chains and create sperate Images.

### Following Docker containers will also run in the Vagrant provided VM:

1. Webserver (apache)
2. Database (mysql)

### Deliverables

* Vagrantfile(s) to set up the development enviornment
* puppet manifests used to provision inside the vm and docker files
* dockerfiles to create docker images we run in the vm
* Report about the project
=======
sysadm-project
==============

repository for sysadmin project on vagrant and docker
>>>>>>> 43c6f4ffc75b9c1a09805c74e2383d95a28782f6