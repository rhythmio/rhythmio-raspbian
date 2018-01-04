
system:
  
  hostname: "raspberrypi"
  
  # Install the latest version of all packages
  # This should be kept on False most of the time since upgrading the packages
  # might introduce new configuration files which will break the system
  upgrade_packages: False
  
  # Remove these packages from the system  
  absend_utils:
    - nano
    - ed
    - vim-tiny
  
  # Install these packages on the system
  required_utils:
    - vim
    - tree
    - htop
  
  # Disable or enable the onboard sound (requires reboot)
  enable_onboard_sound: False
  
  # Enable the device tree debugging (requires reboot)
  enable_device_tree_debug: False
  
  # Setup the HAT overlays (requires reboot)
  # FIXME Change this to support multiple overlays
  device_tree_overlay: "hifiberry-digi"
  #device_tree_overlay: "hifiberry-digi:i2c1=on"  
