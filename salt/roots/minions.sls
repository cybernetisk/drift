# Generic configurations for CYB minions
minion-packages:
  pkg.latest:
    - names:
      - dnf


fail2ban:
  pkg.latest: []
  service.running:
    - enable: True


{% set the_states = salt['state.show_top']() %}
{% set the_pillars = salt['pillar.raw']() %}
{% set the_fqdn = salt['grains.get']('fqdn', {}) %}
{% set the_ipv4 = salt['grains.get']('ipv4', {}) %}
/etc/motd:
  file.managed:
    - contents: |
        Welcome to this CYB virtual machine, configured by: Salt.
        Last updated via Salt at {{ salt['cmd.run']('date') }}.
          IP(s): {{ the_ipv4 | join(', ') }}
          FQDN: {{ the_fqdn }} 
          
          Applied states (apps/software/packages):
            {% for s in the_states | default ('') %}- {{ s }}:
              {% for sls in the_states[s] %}- {{ sls }}
              {% endfor %}
            {%- endfor %}
          Applied pillars (config/prefs/variables):
            {% for p in the_pillars | default ('') %}- {{ p }}
            {% endfor %}


# Allow gracious CYB volunteers to make magic happen
/root/.ssh/authorized_keys:
  file.managed:
    - makedirs: True
    - user: root
    - group: root
    - mode: "600"
    - dir_mode: "700"
    - contents: |
        ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAui8Fj+aSFAUKVkc3W26Foi/wjNC7mz60aHNXwZMFNQfTttmy/I3hr2mCFsyh+prXqC31B1vbjKsB/93YQNDaAZs6GZHVBsxPbAM966fQiNolYJKnStgaeWAjefMoFXl3ejAP0tj1cquxDlGB1cpPwnUC7UjZK/AIPB4ie5QvwOiscEsGKHvCgw20iZIX6DhcXnYToZDlrNSn/w89nrtD9/NccLXVG0of/ZW3MflWhmuFGkqNu9hWSLhp5MSPdWIeY/vWut0OZ2Gz2TGsyWxpNmn7X0ZlFVdyP81x0gUGqn2yUgFcFLZRWs8JrQyTzFZKpDl6Ffd2xUCWKOD9YiOX4Q== tmhogaas@student.matnat.uio.no
        ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwStp38QvLsLPafaGKNOkZ2FIKtGXqbvO31B/kH+d/d5LyzLGZ7EH8LDjzLzh8wa9d4w9/Wg2G4qC/O5wfm78m3n/UoXA4QDUDRm0Ux+cqfyWLgzcT4Cb8KiBvoy7p/wl5iFZ3q0K5XHBMZXChOybhFlGpnUKCQTu2wDhGYiwjYrKoByULT5fy0QIqyKKMoQtJxTY74vzs1oVPsggOlpUrxAmBXBD9cSamGZrfeQs/CMM8+aJPfkCZep1scQB+y+xVdGkKlrvNfLQYdWccBuny8uRQMI/4UzqtTt2MdL/UVUHp7IJg3SZGV6v50c1tdb7bA2zisNxdgSp9XOhED9Gr adriahe@saruman.uio.no
