# Generic configurations for CYB minions
minion-packages:
  pkg.latest:
    - names:
      - python-pygit2
      - dnf
      - fail2ban


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


