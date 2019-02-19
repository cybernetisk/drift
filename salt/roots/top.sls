base:
  # Configuration for all minions
  '*':
    - minions

  # Configuration for SPF-related VM(s?)
  'spf-*.cyb.no':
    - spf
    - spf.database

  # Configuration for docker-machines
  'docker-*.cyb.no':
    - docker

