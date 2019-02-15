Ansible for Cybernetisk Selskab
==========================================

This folder contains all Ansible-related configuration, and is used to
orchestrate the rest of the infrastructure.

Playbooks and roles
-------------------

-   Playbooks are *currently* in this folder.
-   *Roles* are in `./roles`, and may be re-used across playbooks.

### Setting up the site

This involves:

-   checking for a functioning Python installation
-   git repositories and ensuring things are up
-   disabling the CoreOS metadata service

Going forward this will also make sure that the various roles for Atlassian
products are executed, and each one of them will make sure it is
running/started and what-not.

### Getting Ansible to run on CoreOS:

First we need to bootstrap the CoreOS nodes with `python` by downloading a role
from Ansible galaxy, or manually installing it using PyPy and linking to
`/opt/bin`, from within this folder to `./roles`:

    ansible-galaxy install defunctzombie.coreos-bootstrap -p ./roles

Then bootstrap the nodes (remember to add the new hosts to the `hosts.yml` or
`inventory/{production,staging}.yml` file):

    ansible-playbok -i hosts.yml bootstrap.yml

### Running backups on the hosts:

    ansible-playbook -i hosts.yml backup.yml

### Fetching backups from hosts:

    ansible-playbook -i hosts.yml copy_bakcups.yml

Things to do
------------

-   Replace bootstrap method above with a role that is maintained, perhaps our
    own if push comes to shove.

-   [Setup location-based VHOST setting][] [docker config for per-vhost
    location]
    https://github.com/cptactionhank/docker-atlassian-confluence/issues/59

[Setup location-based VHOST setting]: https://confluence.atlassian.com/confkb/how-to-use-nginx-to-proxy-requests-for-confluence-313459790.html
[docker config for per-vhost location]: https://github.com/jwilder/nginx-proxy#per-virtual_host-location-configuration
