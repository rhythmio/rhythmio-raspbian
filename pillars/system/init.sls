
system:
  
  # base configuration
  
  absend_utils:
    - nano
    - ed
    - vim-tiny
  required_utils:
    - vim
    - tree
    - htop
  
  # Disable or enable the onboard sound (requires system restart)
  disable_onboard_sound: True
  
  # Setup the HAT overlays (requires system restart)
  # FIXME Change this to support multiple overlays
  device_tree_overlay: "hifiberry-digi"
