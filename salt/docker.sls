docker-repo:
  pkgrepo.managed:
    - humanname: Docker CE Stable - $basearch
    - baseurl: https://download.docker.com/linux/centos/$releasever/$basearch/test
    - gpgcheck: 1
    - gpgkey: https://download.docker.com/linux/centos/gpg


install-docker:
  pkg.latest:
    - names:
      - docker-ce
      - docker-compose
  service.running:
      - name: docker
      - enable: true

drift-repo:
  git.config_set:
    - value: git@github.com:cybrairai/drift.git
    - repo: /root/drift
