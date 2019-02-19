include:
  - postgres.server
  - postgres.manage

# Note that the pillar must be correctly configured.

spf-database-setup:
  test.nop:
    - require:
      - sls: postgres.manage
      - sls: postgres.server

# vim: ft=sls ts=2 sts=2 sw=2 et
