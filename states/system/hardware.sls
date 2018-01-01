#
# Tune audio output
# ==============================================================================
#
#  FIXME Change set_device_tree_overlay to support multiple overlays
#

{% set disable_onboard_sound = salt['pillar.get']('system:disable_onboard_sound', True) %}
{% set device_tree_overlay = salt['pillar.get']('system:device_tree_overlay', "") %}

server|set_onboard_sound:
  file.replace:
    - name: "/boot/config.txt"
    - pattern: "^dtparam(.*)(=|,)audio=(on|off)"
    - repl: "dtparam\\1\\2audio={% if disable_onboard_sound %}off{% else %}on{% endif %}"
    - append_if_not_found: True
    - not_found_content: "dtparam=audio={% if disable_onboard_sound %}off{% else %}on{% endif %}"
    - backup: False

{% if device_tree_overlay %}
server|set_device_tree_overlay:
  file.replace:
    - name: "/boot/config.txt"
    - pattern: "^(.*)dtoverlay=(.*)"
    - repl: "dtoverlay={{ device_tree_overlay }}"
    - append_if_not_found: True
    - not_found_content: "dtoverlay={{ device_tree_overlay }}"
    - backup: False
{% endif %}
