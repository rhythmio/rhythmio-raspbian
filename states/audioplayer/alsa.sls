#
# Configure ALSA
# ==============================================================================
#
#

audioplayer|configure_alsa:
  file.managed:
    - name: /etc/asound.conf
    - template: jinja
    - source: "salt://audioplayer/files/asound.conf"
