---
title: cidr
section: 1
header: User manual
footer: cidr
author:
  - Sébastien Gross  &lt;seb•ɑƬ•chezwam•ɖɵʈ•org&gt; (**@renard_0**)
date: 2017-10-19 15:25:58
adjusting: b
hyphenate: yes
---

# NAME

cidr - Cidr Is not as Dumb as Rancid

# SYNOPSIS

cidr \[OPTIONS\] COMMAND [ARGS]...

# DESCRIPTION

*cidr* aims to be an easy to use router backup and management tool. It
retrieves router and switches configuration and store them into an *git*
repository. Its design allow user to configure what should be backed up and
how to do it.

# OPTIONS

-c, \--config *PATH*
: Path to the configuration file.

-v, \--verbose
: Run in verbose mode. Use multiple time to increase verbosity level.

-h, \--help
: Display help screen.

# COMMANDS

## **backup-config**

Perform backup of all devices configuration.

This command accept following options:

-t, \--threads *INTEGER*
: Maximum number of parallel job to run.

## **script**

cidr \[OPTIONS\] script HOSTS \[HOSTS\] SCRIPT

Run *SCRIPT* on *HOSTS*. *SCRIPT* can be a path to an existing file or *-*
for standard input. *HOSTS* is an *fnmatch* pattern to be matched against
all device names.


# CONFIGURATION FILE

The configuration consist of a set of `YAML` files with following keys.

## **include**

A list of extra files to me included. Each item is a glob pattern.

    include:
      - cidr.d/*.yml

## **output-dir**

The output path where to store the configuration files This is the base for
the *git* repository.

## **git**

Handle information about *git*.

- **user-name**:  The user name to be used for *git* commits.

- **user-email**:  The user email to be used for *git* commits.


## **drivers**

A dictionary of device drivers where the key is the driver name. A driver
consists of 3 definitions:

- **comment**: character to use for comments in the configuration file
  (default: *!*).

- **term-setup**: An optional list of command to be run to setup terminal.

- **commands**: a list of dictionary of commands to be run on device. Order
  matters since the commands will be run in the same exact order of their
  definition. A command is defined by:

	- **cli**: the command to be run
	- **display**: boolean to determine if the command output should be
      backed up. By default its value is *yes*. For some commands such as
      **terminal length 0** you don't care about their output, you can safely
      set the **display** value to *no*.
	- **quote**: boolean to determine if the command output should be
      prefixed by the **comment** string or not. By default it value is
      *no*. You probably want to set it to *yes* for non configuration
      commands such as **show version**.

- **filters**: a list of python compatible regular expressions to filter the
  command output. This is useful to remove irrelevant lines. 

Example for the *cisco7600* driver:

    cisco7600:
      commands:
        - {cli: terminal length 0, display: no}
        - {cli: terminal width 0, display: no}
        - {cli: show module, quote: yes}
        - {cli: 'dir /all all-filesystems', quote: yes}
        - {cli: show vlan, quote: yes}
        - {cli: show configuration}
      filters:
        - 'Using \d+ out of \d+ bytes'

## **devices**

A list of known devices dictionaries. The keys are:

- **name**: the device DNS name or IP address.
- **username**: the user name to log into the device.
- **key**: path to a ssh private key.
- **key-password**: the password for encrypted private ssh key.
- **key-type**: type of ssh private key (default to `rsa`).
- **password**: the user password to log into the device.
- **enable**: if present, send the *enable* command to the device and use
  this as password.
- **force-IPv4**: force IPv4 usage if a hostname resolves to both IPv6 and
  IPv4 and you don't want to use IPv6.
- **protocol**: protocol to use to connect to the device such as *ssh*.
- **driver**: the defined driver to use for that device.
- **same-as**: List of other devices that has the exact same configuration.


Examples:

    - name: c7600.example.com
      username: cidr
      password: password-for-cidr
      enable: enable-password
      protocol: ssh
      driver: cisco7600

    - name: sw1.example.com
      username: cidr
      password: password-for-cidr
      driver: foundry-fls
      protocol: ssh
      same-as:
        - sw2.example.com
        - sw3.example.com
        - sw4.example.com


# SEE ALSO

- [Exscript](https://github.com/knipknap/exscript/): the connection library
  used by *cidr*.

# COPYRIGHT

Copyright © 2015-2017 Sébastien Gross &lt;seb•ɑƬ•chezwam•ɖɵʈ•org&gt;.

Released under [WTFPL version 2 or higher](http://sam.zoy.org/wtfpl/COPYING).
