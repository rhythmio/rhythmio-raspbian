#
# Do raspbian specific tasks
# ==============================================================================
#
#

{% set upgrade_packages = salt['pillar.get']('system:upgrade_packages', False) %}

# TODO Check that this only runs within a certain time range
{% if upgrade_packages %}
system|upgrade_all_packages:
  module.run:
    - name: pkg.upgrade
    - refresh: True
    - dist_upgrade: False
{% endif %}
