#
# Audio Server Bundle
# ==============================================================================
#
# Setup and configure audio playback and streaming services like alsa,
# shairplay, mpd, etc
#
{% set enable_shairport = salt['pillar.get']('audioserver:enable_shairport', false) %}
{% set enable_mplayer = salt['pillar.get']('audioserver:enable_mplayer', false) %}
{% set enable_sox = salt['pillar.get']('audioserver:enable_sox', false) %}

include:
  - .alsa

  - .shairport{% if not enable_shairport %}.remove{% endif %}
  - .sox{% if not enable_sox %}.remove{% endif %}
  - .mplayer{% if not enable_mplayer %}.remove{% endif %}
  

