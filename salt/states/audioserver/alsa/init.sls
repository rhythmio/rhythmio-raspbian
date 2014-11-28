
sound_conf:
  file.managed:
    - name: /etc/asound.conf
    - template: jinja
    - source: "salt://audioserver/alsa/files/sound.conf"
