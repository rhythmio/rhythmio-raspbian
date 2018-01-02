#
# Do raspbian specific tasks
# ==============================================================================
#
#

{% set upgrade_packages = salt['pillar.get']('system:upgrade_packages', False) %}

{% if upgrade_packages %}
system|upgrade_all_packages:
  module.run:
    - name: pkg.upgrade
    - refresh: True
    - dist_upgrade: False
{% endif %}
