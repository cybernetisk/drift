base:
  # Configuration for all minions
  '*':
    - minions

  # Configuration for SPF-related VM(s?)
  'spf-*.cyb.no':
    - spf
    - spf.database

  'docker-*.cyb.no':
    - docker

