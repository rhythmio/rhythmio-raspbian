
system:
  
  hostname: "raspberrypi"
  
  # Enable to let ssh forward X11
  enable_x11_forwarding: False
  
  # Let users authenticate using certificates
  enable_public_key_authentication: True
  
  users:
    pi:
      enabled: True
      groups: ['pi', 'adm', 'dialout', 'cdrom', 'sudo', 'audio', 'video', 'plugdev', 'games', 'users', 'input', 'netdev', 'spi', 'i2c', 'gpio']
      password_hash: "$1$/GYKx56Z$Fr7EDiATmB8n3I.MyM5o90" # generate with `openssl passwd -1`
  
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
    - vim       # The real vim
    - tree      # list directories as tree
    - htop      # a better version than top
    - powertop  # analyse estimated power consumtion
  
  # Disable or enable the onboard sound (requires reboot)
  enable_onboard_sound: True
  
  # Enable the device tree debugging (requires reboot)
  enable_device_tree_debug: False
  
  # Setup the HAT overlays (requires reboot)
  #device_tree_overlay: "hifiberry-digi"
  device_tree_overlay: ""
