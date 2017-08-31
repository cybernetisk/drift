docker-repo:
  pkgrepo.managed:
    - humanname: Docker CE Stable - $basearch
    - baseurl: https://download.docker.com/linux/fedora/$releasever/$basearch/stable
    - gpgcheck: 1
    - gpgkey: https://download.docker.com/linux/fedora/gpg


install-docker:
  pkg.latest:
    - names:
      - docker-ce
      - docker-compose
  service.running:
      - name: docker
      - enable: true
