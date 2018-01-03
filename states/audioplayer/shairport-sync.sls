#
# Shairport sync
# ==============================================================================
#
# This is a build from source in order to get the latest updates and to not
# install all the dependencies from the raspbian packages.
# 

{% set shairportsync_build_path = salt['pillar.get']('audioplayer:shairportsync_build_path', "/tmp/shairport-sync") %}

audioplayer|install_shairport-sync_dependencies:
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

audioplayer|clone_shairport-sync_source:
  cmd.run:
    - name: "git clone https://github.com/mikebrady/shairport-sync {{ shairportsync_build_path }}"
    - creates:
      - "{{ shairportsync_build_path }}"

audioplayer|build_shairportsync:
  cmd.script:
    - template: jinja
    - source: "salt://audioplayer/files/build_shairport-sync.sh"
    - cwd: "{{ shairportsync_build_path }}"
    - creates:
      - "/usr/local/bin/shairport-sync"
    - require:
      - pkg: audioplayer|install_shairport-sync_dependencies
      - cmd: audioplayer|clone_shairport-sync_source

audioplayer|shairport-sync:
  file.managed:
    - name: "/etc/shairport-sync.conf"
    - source: "salt://audioplayer/files/shairport-sync.conf"
    - require:
      - cmd: audioplayer|build_shairportsync
    - watch_in:
      - service: audioplayer|shairport-sync
  service.running:
    - name: "shairport-sync"
    - enable: True
    - require:
      - cmd: audioplayer|build_shairportsync
