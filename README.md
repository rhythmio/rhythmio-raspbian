Rhythm/io for Raspbian
================================================================================

This are configuration scripts to setup, configure and manage one or multiple 
raspberry pi computers. The current iteration manages a raspbian system and 
configures an audio player with shairport-sync.

### Why and how

Installing one of the preconfigured OS projects like volumio or rune audio would
be the easy choice but would also be a black box were updates are dependent on
the maintainers of these projects. However having a set of random bash scripts 
or a fixed tutorial becomes messy quit quickly.

Instead  this project uses the [SaltStack][salt] automation 
system. This has the benefit that the configuration files have a consistent 
syntax, the steps are easy to reproduce and time is saved by not running 
configurations which were already executed. The scripts can also be extended to 
have additional modules when needed and multiple machines with slightly different
configurations can be easily managed at once.

The provided configuration scripts are written to be used with `salt-ssh`. 
This is the salt command which handles the deployment over SSH instead of using 
a master-slave (minion) setup. This setup was chosen since PI is not as 
resourceful as a server in a rack, most of the time only a single machine is
managed and because the focus is to keep the setup fast and flexible.

### Prerequisites

This project was developed using [Raspberry Pi 2 B][rpi2] and 
[Raspberry PI 3 B][rpi3] models. Other PI models might work, too when they can 
run the latest version of Raspian.

An additional hardware component was a [Hifiberry Digi+][digi+] board. But this board is
optional and the project can be configured to use a different board, the 
standard audio out or audio over HDMI instead. 

Of course another computer is needed to create the SD card and managing the PI
using SaltStack.

### Installation

[TODO] Describe the full process in detail

- Download Raspian Lite and burn the SD card
- Mount the SD card and change boot.txt / add wp_supplicant
- Install SaltStack on your computer
- Boot the PI and ping it
- Initial run

### Helpful command overview

Apply all states to all machines in the roster

    > salt-ssh '*' state.apply

Reboot all machines in the roster

    > salt-ssh '*' system.reboot

Shutdown all machines in the roster
    
    > salt-ssh '*' system.halt


[salt]: http://www.saltstack.com/
[rpi2]: https://www.raspberrypi.org/products/raspberry-pi-2-model-b/
[rpi3]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[digi+]: https://www.hifiberry.com/products/digiplus/
