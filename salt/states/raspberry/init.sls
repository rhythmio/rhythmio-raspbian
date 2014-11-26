#
# Raspberry Bundle
# ==============================================================================
#
# This module is used to make configurations on the pi, install essential
# packages and remove unused packages, add users, etc
#
include:
  - raspberry.apt.cleanup
  - raspberry.apt.update
  {% if salt['pillar.get']('raspberry:auto_upgrade_enabled', false) %}
  - raspberry.apt.upgrade
  {% endif %}
  - raspberry.users

maintance_utils:
  pkg.installed:
    - pkgs:
      - vim
      - htop
      - tree
