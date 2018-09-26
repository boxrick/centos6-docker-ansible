# centos6-docker-ansible

## What is this

This is CentOS 6 Docker with SSH installed for usage inside Vagrant.

This is an Docker image which is designed to allow Ansible testing, Virtualbox and virtual machines are really heavy. Conceptually Docker is good, but is designed for small lightweight services.
The idea here is to be able to allow quick development of Ansible roles but not have to have a complicated system in place or a heavyweight virtual machine.

## Supported tags

* `latest`

## Running

This is enough to get started to run Ansible against a Docker container with an example Vagrant and Ansible playbook.

Simply type: `vagrant up --provider docker`

## License

MIT
