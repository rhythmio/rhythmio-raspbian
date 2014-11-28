
module_blacklist:
  file.managed:
    - name: /etc/modprobe.d/raspi-blacklist.conf
    - template: jinja
    - source: "salt://raspberry/firmware/files/blacklist.conf"

modules_config:
  file.managed:
    - name: /etc/modules
    - template: jinja
    - source: "salt://raspberry/firmware/files/modules.conf"
    - context:
        enable_hifiberry_dac: {{ salt['pillar.get']('raspberry:enable_hifiberry_dac', false) }}
        enable_hifiberry_dac_plus: {{ salt['pillar.get']('raspberry:enable_hifiberry_dac_plus', false) }}
        enable_hifiberry_digi_series: {{ salt['pillar.get']('raspberry:enable_hifiberry_digi_series', false) }}
        enable_hifiberry_amp: {{ salt['pillar.get']('raspberry:enable_hifiberry_amp', false) }}
