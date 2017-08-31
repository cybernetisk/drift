postgres:
  pkg.latest:
    - names:
      - postgresql-server
      - postgresql
    - require_in:
      - postgres_user: spf-database-user
      - postgres_database: spf-database
  service.running:
    - name: postgresql
    - enable: True
    - require_in:
      - postgres_user: spf-database-user
      - postgres_database: spf-database


spf-database-user:
  postgres_user.present:
    - name: {{ salt['pillar.get']('spf:db_username', 'spf') }}
    - password: {{ salt['pillar.get']('spf:db_password') }}
    - superuser: True

spf-database:
  postgres_database.present:
    - name: {{ salt['pillar.get']('spf:db_name', 'spbm') }}
    - db_password: {{ salt['pillar.get']('spf:db_password') }}
    - require:
      - postgres_user: spf-database-user
      - postgres_database: spf-database

