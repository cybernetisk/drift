# Initial roots file for SPF setup

# SPBM requirements and setu

spf-packages:
  pkg.latest:
    - names:
      - python34
      - postgresql
    - require_in:
      - git: spbm-staging
      - git: spbm-prod


# Update pip and install virtualenv
# Repo version of virtualenv is too old.
pip-and-virtualenv:
  cmd.run:
    - name: |
        pip install -U pip && pip install -U virtualenv
    - unless: pip show virtualenv
    - runas: root
    - require_in:
      - virtualenv: spbm-prod-venv
      - virtualenv: spbm-staging-venv


spbm-folders:
  file.directory:
    - names:
      - /srv/app/prod/
      - /srv/app/staging/
      - /srv/venv/prod/
      - /srv/venv/staging/
    - makedirs: True
    - force: True
    - require_in:
      - git: spbm-staging
      - git: spbm-prod



spbm-prod:
  git.latest:
    - name: "https://github.com/SPF-UiO/spbm.git"
    - target: /srv/app/prod/
    - branch: master



spbm-staging:
  git.latest:
    - name: "https://github.com/SPF-UiO/spbm.git"
    - target: /srv/app/staging/
    - branch: trunk


spbm-prod-venv:
  virtualenv.managed:
    - name: /srv/venv/prod/
    - python: python3
    - requirements: /srv/app/prod/requirements.txt
    - use_wheel: True
    - require:
      - git: spbm-prod


spbm-staging-venv:
  virtualenv.managed:
    - name: /srv/venv/staging/
    - python: python3
    - requirements: /srv/app/staging/requirements.txt
    - use_wheel: True
    - require:
      - git: spbm-staging




