#
# Raspberry Bundle
# ==============================================================================
#
# This module is used to make configurations on the pi, install essential
# packages and remove unused packages, add users, etc
#
include:
  - raspberry.packages.cleanup
  - raspberry.packages.update
  {% if salt['pillar.get']('raspberry:auto_upgrade_enabled', false) %}
  - raspberry.packages.upgrade
  {% endif %}

  - raspberry.firmware.update
  - raspberry.firmware.modules

  - raspberry.users

maintance_utils:
  pkg.installed:
    - pkgs:
      - vim
      - htop
      - tree
