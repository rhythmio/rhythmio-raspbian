#
# User Setup
# ==============================================================================
#

{% for user, config in salt['pillar.get']('system:users', {}).items() %}
{% if config.enabled %}

system|add_user_{{ user }}:
  user.present:
    - name: {{ user }}
    - shell: /bin/bash
    - password: {{ config.password_hash }}
    - groups:
      {% for group in config.groups %}
      - "{{ group }}"
      {% endfor %}
  
{% else %}

system|remove_user_{{ user }}:
  user.absent:
    - name: {{ user }}
    - force: true
    - purge: true

{% endif %}
{% endfor %}
