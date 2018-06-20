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

    ./cidr -v --config cidr.yml backup-config -t 64

# Supported devices

Here is a list of devices on witch `cidr` has been successfuly run. Some
other may work as well. Please let me know if you have other working
devices.

* Cisco
  * 2800 Series
  * 7300 Series
  * 7600 Series
  * ASR9K Series
  * ASA Series
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

* Oracle
  * Acme Packet Net-Net 3820 SBC


Please note that for some devices (such as Acme Packet) The configuration
might not be reimported as it.

# Known issues


* `RequirementParseError: Invalid requirement, parse error at "''"`

In some environment you may experience errors like:

```
Traceback (most recent call last):
  File "/usr/local/lib/python2.7/dist-packages/Exscript/workqueue/job.py", line 78, in run
    self.function(self)
  File "/usr/local/lib/python2.7/dist-packages/Exscript/queue.py", line 101, in _wrapped
    conn.connect(host.get_address(), host.get_tcp_port())
  File "/usr/local/lib/python2.7/dist-packages/Exscript/protocols/protocol.py", line 609, in connect
    return self._connect_hook(self.host, port)
  File "/usr/local/lib/python2.7/dist-packages/Exscript/protocols/ssh2.py", line 299, in _connect_hook
    self.client = self._paramiko_connect()
  File "/usr/local/lib/python2.7/dist-packages/Exscript/protocols/ssh2.py", line 162, in _paramiko_connect
    t.start_client()
  File "/usr/lib/python2.7/dist-packages/paramiko/transport.py", line 493, in start_client
    raise e
RequirementParseError: Invalid requirement, parse error at "''"
```

This happens randomly without any particular reason. This seems to be
related to a `paramiko`, `pyca`, `packaging` or `setuptools` bug in
multi-threading mode. See:

* https://github.com/paramiko/paramiko/issues/931
* https://github.com/pyca/cryptography/issues/3495
* https://github.com/pypa/packaging/issues/104

The best way is to reduce the number of threads.
