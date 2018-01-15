#
# Prepare the network
# ==============================================================================
#
# TODO Manage the wpa_supplicant config in /boot

{% set hostname = salt['pillar.get']('system:hostname', "raspberrypi") %}

system|set_hostname:
  cmd.run:
    - name: hostnamectl set-hostname {{ hostname }}
    - unless: test "$(hostname)" = {{ hostname }}
