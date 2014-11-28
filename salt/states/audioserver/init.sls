#
# Audio Server Bundle
# ==============================================================================
#
# Setup and configure audio playback and streaming services like alsa,
# shairplay, mpd, etc
#
include:
  - audioserver.alsa
  
  # Optional audio players
  - audioserver.sox{% if not salt['pillar.get']('audioserver:enable_sox', false) %}.remove{% endif %}
  - audioserver.mplayer{% if not salt['pillar.get']('audioserver:enable_mplayer', false) %}.remove{% endif %}

