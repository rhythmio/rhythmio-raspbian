
raspbian:
  auto_upgrade_enabled: false
  
  # Audio hardware support
  enable_hifiberry_dac: false
  enable_hifiberry_dac_plus: false
  enable_hifiberry_digi_series: true
  enable_hifiberry_amp: false

unnecessary_raspbian_apps:
  # Editors
  - "nano"
  - "ed"
  - "vim-tiny"

  # Modules are deployed with salt
  - "tasksel"
  - "tasksel-data"

  # Applications
  - "minecraft-pi"
  - "penguinspuzzle"
  - "python-minecraftpi"
  - "galculator"
  - "gpicview"
  - "leafpad"
  - "omxplayer"
  - "dillo"
  - "raspberrypi-artwork"
  - "xarchiver"

  # Window manager
  - "desktop-base"
  - "lightdm"
  - "lxappearance"
  - "lxde-common"
  - "lxde-icon-theme"
  - "lxinput"
  - "lxpanel"
  - "lxpolkit"
  - "lxrandr"
  - "lxsession-edit"
  - "lxshortcut"
  - "lxtask"
  - "lxterminal"
  - "lxmenu-data"
  - "gtk2-engines"
  - "gnome-themes-standard-data"
  - "gstreamer1.0-omx"
  - "gstreamer1.0-alsa"
  - "gstreamer1.0-libav"
  - "libboost-iostreams1.46.1"
  - "libboost-iostreams1.48.0"
  - "libboost-iostreams1.50.0"
  - "libident"
  - "libjbig0"
  - "libsigc++-1.2-5c2"
  - "libsysfs2"
  - "obconf"
  - "openbox"

  # XServer
  - "xinit"
  - "xserver-xorg"
  - "xserver-xorg-video-fbdev"
  - "x11-utils"
  - "x11-common"
  - "weston"
  - "dbus-x11"
  - "libx11-data"
  - "xauth"
  - "xkb-data"
  
