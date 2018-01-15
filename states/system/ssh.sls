#
# SSH Setup
# ==============================================================================
#

{% set enable_x11_forwarding = salt['pillar.get']('system:enable_x11_forwarding', False) %}

# TODO Add to defaults pillars
{% set enable_public_key_authentication = salt['pillar.get']('system:enable_public_key_authentication', True) %}

system|openssh:
  pkg.installed:
    - name: openssh-server
  service.running:
    - name: ssh
    - enable: true

system|set_x11_forwarding:
  file.replace:
    - name: "/etc/ssh/sshd_config"
    - pattern: "#?X11Forwarding .*"
    - repl: "X11Forwarding {{ 'yes' if enable_x11_forwarding else 'no' }}"
    - append_if_not_found: true
    - require:
      - pkg: system|openssh
    - listen_in:
      - service: system|openssh

system|set_public_key_authentication:
  file.replace:
    - name: "/etc/ssh/sshd_config"
    - pattern: "#?PubkeyAuthentication .*"
    - repl: "PubkeyAuthentication {{ 'yes' if enable_public_key_authentication else 'no' }}"
    - append_if_not_found: true
    - require:
      - pkg: system|openssh
    - listen_in:
      - service: system|openssh
