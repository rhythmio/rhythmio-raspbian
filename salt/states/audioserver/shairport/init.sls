
{% set rebuild_enabled = salt["pillar.get"]("audioserver_shairport:enable_rebuild", false) %}
{% set repository = salt["pillar.get"]("audioserver_shairport:repository", "https://github.com/abrasive/shairport.git") %}
{% set build_path = salt["pillar.get"]("audioserver_shairport:build_path", "/tmp/shairport") %}

shairport_build_dependencies:
  pkg.installed:
    - pkgs:
      - libssl-dev 
      - libavahi-client-dev
      - libasound2-dev
    - onlyif: 'if [ -d "{{ build_path }}" ]{% if not rebuild_enabled %} && [ ! -f "/usr/local/bin/shairport" ]{% endif %}; then exit 0; else exit 1; fi'

build_shairport:
  cmd.run:
    - name: |
        if [ ! -d "{{ build_path }}" ]; then
          git clone {{ repository }} {{ build_path }};
        else
          cd {{ build_path }};
          git reset --hard;
          git pull;
        fi
        cd {{ build_path }};
        ./configure;
        make;
        make install;
    - shell: '/bin/bash'
    {% if not rebuild_enabled %}
    - onlyif: 'if [ ! -f "/usr/local/bin/shairport" ]; then exit 0; else exit 1; fi'
    {% endif %}
    - watch_in: restart_shairport
    - require:
      - pkg: shairport_build_dependencies

shairport_user:
  user.present:
    - name: shairport
    - createhome: false
    - groups:
      - audio

shairport_defaults:
  file.managed:
    - name: "/etc/default/shairport"
    - source: "salt://audioserver/shairport/files/defaults.conf"
    - user: root
    - group: root
    - mode: 644

shairport_logrotation:
  file.managed:
    - name: "/etc/logrotate.d/shairport"
    - source: "salt://audioserver/shairport/files/logrotate.conf"
    - user: root
    - group: root
    - mode: 755

shairport_init_script:
  file.managed:
    - name: "/etc/init.d/shairport"
    - source: "salt://audioserver/shairport/files/init.sh"
    - user: root
    - group: root
    - mode: 755
    - require:
      - user: shairport_user
      - file: shairport_defaults
      - file: shairport_logrotation

run_shairport:
  service.running:
    - enable: true
    - name: shairport
    - watch:
      - cmd: build_shairport
      - file: shairport_init_script
      - file: shairport_defaults
      - file: shairport_logrotation
