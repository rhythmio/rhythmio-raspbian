
Rhythm/io for Raspbian
================================================================================

This [SaltStack](http://www.saltstack.com/) scripts can be used to setup and
maintain a hifi server with the raspbian linux distribution and deploy the
Rhythm/io user interface on a raspberry pi.

## About this project

The goal of the Rhythm/io project is the development of an awesome user
interface for high fidelity server projects. It is out of scope to maintain
one or multiple custom linux distributions with public package repositories.

Since the Rythm/io UI depends on various third party software components and
may run on different operating systems and hardware configurations, the
decision was made to provide a set of "receipts" for deployment.   
With this scripts it is simple to setup an environment which is maintainable,
testable and will produce the same result on each run.

## Supported hardware

Currently the only hardware installed by this scripts is the raspberry pi b+
with the hifiberry digi+ module. Of course this will change in the future.

## How to install

**This scripts are under heavy development and may break your pi or override 
software on your computer. Running these scripts is at your own risk.**

This scripts require a raspberry pi, an sd card with the current raspbian
image installed and saltstack (2014.7) installed on your computer.

When everything is setup and the pi is running go into the project folder,
change the roster file and pillar to fit your needs and run salt ssh like this:

	salt-ssh "raspbian-pi" state.highstate
