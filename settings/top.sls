
{% set current_id = salt['grains.get']('id') %}

base:
  '*':
    - system
    - audioplayer
  
  # Load a custom file per host from the settings folder
  {% if salt['file.file_exists']('machines/{0}.sls'.format(current_id)) %}
  '{{ current_id }}':
     - {{ current_id }}
  {% endif %}
