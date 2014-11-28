
# Depends: galculator, gpicview, leafpad, lxappearance, lxde-core, lxde-icon-theme, lxinput, lxrandr, lxsession-edit, lxshortcut, lxterminal, obconf, xarchiver
# Recommends: iceweasel | www-browser, lightdm | x-display-manager, lxmusic, menu-xdg, network-manager-gnome, lxpolkit, xserver-xorg
# Suggests: lxlauncher, lxtask
#
# Depends: libc6 (>= 2.13-28), libglib2.0-0 (>= 2.24.0), libice6 (>= 1:1.0.0), libobrender27 (>= 3.5.0), libobt0 (>= 3.5.0), libsm6, libstartup-notification0 (>= 0.7), libx11-6, libxau6, libxcursor1 (>> 1.1.2), libxext6, libxinerama1, libxml2 (>= 2.7.4), libxrandr2, libxrender1
# Recommends: openbox-themes, obconf
# Suggests: menu, ttf-dejavu, python, libxml2-dev
#
# Depends: java7-runtime | java8-runtime, libatlas3-base (>= 3.8.4-9), libpango1.0-0 (>= 1.30.0-1), libcairo2 (>= 1.12.2-3), libglib2.0-0 (>= 2.33.12+really2.32.4-5), libffi5 (>= 3.0.10-3+b3), libpixman-1-0 (>= 0.26.0-4+deb7u1), zlib1g (>= 1:1.2.7.dfsg-13), libfontconfig1 (>= 2.9.0-7.1), libfreetype6 (>= 2.4.9-1.1), libpng12-0 (>= 1.2.49-1), libexpat1 (>= 2.1.0-1+deb7u1), libuuid1 (>= 2.20.1-5.3) 
# Recommends: oracle-java7-jdk | oracle-java8-jdk
remove_desktop:
  pkg.purged:
    - pkgs:
      - "wolfram-engine"
      - "java-common"
      - "minecraft-pi"
      - "penguinspuzzle"
      - "python-minecraftpi"
      - "galculator"
      - "gpicview"
      - "leafpad"
      - "omxplayer"
      - "dillo"

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

      - "obconf"
      - "openbox"
      - "raspberrypi-artwork"
      - "xarchiver"
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

      - "nano"
      - "ed"
      - "vim-tiny"

removing_packages:
  cmd.run:
    - name: "apt-get --assume-yes --purge autoremove"

