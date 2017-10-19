[![Tweet this](http://img.shields.io/badge/%20-Tweet-00aced.svg)](https://twitter.com/intent/tweet?tw_p=tweetbutton&via=renard_0&url=https%3A%2F%2Fgithub.com%2Frenard%2Fcidr&text=%23Cidr%20Is%20not%20as%20Dumb%20as%20Rancid%2C%20backup%20your%20network%20devices%20configuration.)
[![Follow me on twitter](http://img.shields.io/badge/Twitter-Follow-00aced.svg)](https://twitter.com/intent/follow?region=follow_link&screen_name=renard_0&tw_p=followbutton)


# NOTES

This is an early stage.

You can check the [manpage](cidr.1.md).

More documentation has to come. For now you have to read the code. Sorry guys!

## install exscript

You can check my
[Launchpad page](https://launchpad.net/~renard0/+archive/ubuntu/utils/) to
get `exscript` debian package. Please note that this package has been
generated for `trusty` and might also work on other distos. Let me know if
this works for you.


Basicaly you have to put in your `/etc/apt/sources.list`:

    deb http://ppa.launchpad.net/renard0/utils/ubuntu trusty main 


and run as `root`:

	apt-get update
	apt-get install exscript



## Dependancy

- exscript: https://github.com/knipknap/exscript
- click: https://github.com/mitsuhiko/click

## Run

Configure `cidr.yml` file with devices and run:

    ./cidr.py -v --config cidr.yml backup-config -t 64

# Supported devices

Here is a list of devices on witch `cidr` has been successfully run.

* Cisco
  * 7600 Series
  * ASR9K Series
  * C2960X Series
  * UC520 Series

* Dell
  * PowerConnect M6220

* Foundry
  * MLX NetIron
  * FLS FLS-48G

* Juniper
  * MX80
  * Ex4550 Series
