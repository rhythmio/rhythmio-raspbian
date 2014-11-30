#
# Remove shairport
#
include:
  - audioserver.shairport.cleanup

# TODO Remove user
# TODO Remove locks and info files
# TODO Remove log files

stop_shairport:
  service.disabled:
    - name: shairport

remove_shairport_init:
  file.absent:
    - name: '/etc/init.d/shairport'
    - require:
      - service: stop_shairport

remove_shairport:
  file.absent:
    - name: '/usr/local/bin/shairport'
    - require:
      - service: stop_shairport

remove_shairport_defaults:
  file.absent:
    - name: '/etc/default/shairport'
    - require:
      - service: stop_shairport


remove_shairport_init:
  file.absent:
    - name: '/etc/logrotate.d/shairport'
    - require:
      - service: stop_shairport
