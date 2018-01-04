#
# Shairport sync
# ==============================================================================
#
# This is a build from source in order to get the latest updates and to not
# install all the dependencies from the raspbian packages.
# 

{% set shairportsync_build_path = salt['pillar.get']('audioplayer:shairportsync_build_path', "/tmp/shairport-sync") %}
{% set force_shairportsync_build = salt['pillar.get']('audioplayer:force_shairportsync_build', False) %}
{% set shairportsync_settings = salt['pillar.get']('audioplayer:shairport_settings', {}) %}

audioplayer|install_shairportsync_dependencies:
  pkg.installed:
    - pkgs:
      - build-essential
      - git
      - xmltoman
      - autoconf
      - automake
      - libtool
      - libdaemon-dev
      - libpopt-dev
      - libconfig-dev
      - libasound2-dev # For alsa support
      - avahi-daemon # For zeroconf support
      - libavahi-client-dev # For zeroconf support
      - libssl-dev
      - libsoxr-dev

audioplayer|shairportsync_sources:
  cmd.run:
    - name: "cd {{ shairportsync_build_path}} && git checkout -f ."
    - onlyif: "test -d {{ shairportsync_build_path }}"
    - require:
      - pkg: audioplayer|install_shairportsync_dependencies
  git.latest:
    - name: https://github.com/mikebrady/shairport-sync
    - target: "{{ shairportsync_build_path }}"
    - unless: "test -f /usr/local/bin/shairport-sync"
    - require:
      - pkg: audioplayer|install_shairportsync_dependencies
      - cmd: audioplayer|shairportsync_sources

audioplayer|build_shairportsync:
  cmd.script:
    - template: jinja
    - source: "salt://audioplayer/files/build_shairport-sync.sh"
    - cwd: "{{ shairportsync_build_path }}"
    - creates:
      - "/usr/local/bin/shairport-sync"
    - require:
      - pkg: audioplayer|install_shairportsync_dependencies
      - git: audioplayer|shairportsync_sources

audioplayer|shairportsync:
  file.managed:
    - name: "/etc/shairport-sync.conf"
    - source: "salt://audioplayer/files/shairport-sync.conf"
    - template: jinja
    - context:
        name: "{{ shairportsync_settings.name|default('%h') }}"
        password: "{{ shairportsync_settings.password|default('') }}"
        ignore_volume: {{ shairportsync_settings.ignore_volume|default(True)}}
    - watch_in:
      - service: audioplayer|shairportsync
  service.running:
    - name: "shairport-sync"
    - enable: True
    - onlyif: "test -f /lib/systemd/system/shairport-sync.service"
