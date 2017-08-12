# Initial roots file for SPF setup

# SPBM requirements and setup

python-packages:
  pkg.latest:
    - names:
      - python34
      - python-virtualenv
    - require_in:
      - git: spbm-staging
      - git: spbm-prod


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
  virtualenv_mod.managed:
    - name: /srv/venv/prod/
    - requirements: /srv/app/prod/requirements.txt
    - use_wheel: True
    - require:
      - git: spbm-prod


spbm-staging-venv:
  virtualenv_mod.managed:
    - name: /srv/venv/staging/
    - requirements: /srv/app/staging/requirements.txt
    - use_wheel: True
    - require:
      - git: spbm-staging




