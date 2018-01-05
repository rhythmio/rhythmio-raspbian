#
# System base installations and removals
# ==============================================================================
#
# This adds generally used utility packages and removes packages not 
# necessary for this project. 
#
# Do not use this state configuration to do everything.
#

{% set absend_utils = salt['pillar.get']('system:absend_utils', []) %}
{% set required_utils = salt['pillar.get']('system:required_utils', []) %}

{% if absend_utils %}
system|remove_utils:
  pkg.purged:
    - pkgs:
      {% for util in absend_utils  %}
      - "{{ util }}"
      {% endfor %}
{% endif %}

{% if required_utils %}
system|install_utils:
  pkg.installed:
    - pkgs:
      {% for util in required_utils  %}
      - "{{ util }}"
      {% endfor %}
{% endif %}  

system|restart:
  module.wait:
    - name: "system.reboot"
    - bg: True
    