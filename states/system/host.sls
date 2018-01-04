#
# Prepare the host system
# ==============================================================================
#

{% set hostname = salt['pillar.get']('system:hostname', "raspberrypi") %}

system|set_hostname:
  cmd.run:
    - name: hostnamectl set-hostname {{ hostname }}
    - unless: test "$(hostname -f)" = {{ hostname }}
