# Initial roots file for SPF setup

# SPBM requirements and setup
spf-packages:
  pkg.latest:
    - names:
      - python3
      - python3-pip
      - python3-devel
      # to build uWSGI
      - gcc
    - require_in:
      - git: spbm-staging
      - git: spbm-prod


# Update pip and install virtualenv
# Repo version of virtualenv is too old.
install-virtualenv:
  cmd.run:
    - name: |
        pip3 install -U virtualenv
    - unless: pip show virtualenv
    - runas: root
    - require_in:
      - virtualenv: spbm-prod-venv
      - virtualenv: spbm-staging-venv

spbm:
  user.present: 
    - require_in:
      - file: spbm
  file.directory:
    - names:
      - /srv/app/prod/
      - /srv/app/staging/
      - /srv/venv/prod/
      - /srv/venv/staging/
    - makedirs: True
    - user: spbm
    - recurse:
      - user
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




