---
layout: inset
title: OpenPLC on Linux
redirect_from:
  - /getting-started-linux
---

**These instructions are targeted for Debian-based distributions (like Ubuntu, Mint, Kali, etc).**

The best way to get OpenPLC files into your system is by using git. Usually, git comes preinstalled on most Linux distributions. If for some reason you don't have git installed on your system, you can install it by typing:

```
sudo apt-get install git
```

​
To install OpenPLC type these lines on the terminal:

```
git clone https://github.com/thiagoralves/OpenPLC_v3.git
cd OpenPLC_v3
./install.sh linux
```
​
The installation process will take a while (up to 1 hour depending on your
system). Meanwhile, grab a [insert your favorite beverage here] and relax!
Once OpenPLC is installed, just reboot your device and it will start
automatically after boot.

The OpenPLC runtime has a built-in webserver that you can access. While OpenPLC
runtime is running, open your browser and type:

```
localhost:8080
```
​
Once you access OpenPLC web interface, you should see in your browser window
a login page like this:

![](/runtime/img/login.png)

The default username and password is openplc (login) and openplc (password).
This means that the first thing you must do after logging in for the first
time is change the default username and password! It is very easy to do that.
Just go to the Users menu, click on the OpenPLC User and change the information
as you like.

![](/runtime/img/edituser.png)

Once you save the changes you will be prompted to login again. Just login with your new credentials and you will be good to go!

## Setup Slave I/O

A great way to use OpenPLC on your Linux machine is with slave I/Os. Therefore,
your Linux machine can run OpenPLC Runtime and act as a Soft-PLC controlling
real boards configured as Slave I/O devices. Go to the Getting Started page
and follow the instructions to setup one of the supported platforms as slave
devices. Then, through the web interface, add your slave devices on the
"Slave Devices" menu. Keep in mind that slave devices are attached to address
100 onward (i.e. `%IX100.0`, `%IW100`, `%QX100.0`, and `%QW100`).

{% include firstproject.md %}
