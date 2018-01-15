system:
  hostname: "raspberrypi"
  upgrade_packages: True
  enable_onboard_sound: True  
  enable_device_tree_debug: False
  device_tree_overlay: ""
  users:
    pi:
      enabled: True
      groups: ['pi', 'adm', 'dialout', 'cdrom', 'sudo', 'audio', 'video', 'plugdev', 'games', 'users', 'input', 'netdev', 'spi', 'i2c', 'gpio']
      password_hash: "$1$/GYKx56Z$Fr7EDiATmB8n3I.MyM5o90" # generate with `openssl passwd -1`

audioplayer:  
  shairport_settings:
    name: "Raspberry PI"
    password: ""
    ignore_volume: False
