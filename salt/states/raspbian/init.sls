#
# Raspberry Bundle
# ==============================================================================
#
# This module is used to make configurations on the pi, install essential
# packages and remove unused packages, add users, etc
#
# libx11-.* 
# lxde-.* 
# raspberrypi-artwork 
# xkb-data 
# omxplayer 
# penguinspuzzle 
# sgml-base 
# xml-core 
# alsa-.* 
# cifs-.* 
# samba-.* 
# fonts-.* 
# desktop-* 
# gnome-.*

{% set unnecessary_apps = salt["pillar.get"]("unnecessary_raspbian_apps", []) %}

include:
  - .apt.update
  {% if salt['pillar.get']('raspbian:auto_upgrade_enabled', false) %}
  - .apt.upgrade
  {% endif %}
  - .apt.autoremove

  - .firmware
  - .users
  - .devtools

strip_raspbian:
  # TODO Move the list to the pillars
  pkg.purged:
    - pkgs:
      {% for app in unnecessary_apps %}
      - "{{ app }}"
      {% endfor %}
    - prereq:
      - cmd: autoremove

