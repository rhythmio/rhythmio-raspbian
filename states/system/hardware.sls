#
# Tune audio output
# ==============================================================================
#
#  FIXME Change set_device_tree_overlay to support multiple overlays
#

{% set enable_onboard_sound = salt['pillar.get']('system:enable_onboard_sound', True) %}
{% set enable_device_tree_debug = salt['pillar.get']('system:enable_device_tree_debug', False) %}
{% set device_tree_overlay = salt['pillar.get']('system:device_tree_overlay', "") %}

server|set_onboard_sound:
  file.replace:
    - name: "/boot/config.txt"
    - pattern: "^dtparam(.*)(=|,)audio=(on|off)"
    - repl: "dtparam\\1\\2audio={% if enable_onboard_sound %}on{% else %}off{% endif %}"
    - append_if_not_found: True
    - not_found_content: "dtparam=audio={% if enable_onboard_sound %}on{% else %}off{% endif %}"
    - backup: False
    - listen_in:
      - module: system|restart

server|set_device_tree_debug:
  file.replace:
    - name: "/boot/config.txt"
    - pattern: "^dtdebug=(.*)"
    - repl: "dtdebug={% if enable_device_tree_debug %}1{% else %}0{% endif %}"
    - append_if_not_found: True
    - not_found_content: "dtdebug={% if enable_device_tree_debug %}1{% else %}0{% endif %}"
    - backup: False
    - require_in:
      - module: system|restart
    - listen_in:
      - module: system|restart

{% if device_tree_overlay %}
server|set_device_tree_overlay:
  file.replace:
    - name: "/boot/config.txt"
    - pattern: "^(.*)dtoverlay={{ device_tree_overlay }}(.*)"
    - repl: "dtoverlay={{ device_tree_overlay }}"
    - append_if_not_found: True
    - not_found_content: "dtoverlay={{ device_tree_overlay }}"
    - backup: False
    - listen_in:
      - module: system|restart
{% endif %}
