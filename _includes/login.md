
The OpenPLC runtime has a built-in webserver that allows you to configure
OpenPLC and also to upload new programs for it to run. This webserver can be
accessed by opening a web browser on your computer and typing the IP address
of your OpenPLC device at port 8080. For example, if your {{ include.devicename }}
has the IP 192.168.0.103 on your network, you should type this on your browser:

![](/runtime/img/ipaddress.webp)

If you don't know the IP address of your board, the Raspberry Pi foundation
has a [nice guide](https://www.raspberrypi.org/documentation/remote-access/ip-address.md)
to help you out.

Once you access OpenPLC webserver, you should see in your browser window a
login page like this:

![](/runtime/img/login.webp)

The default username and password is openplc (login) and openplc (password).
This means that the first thing you must do after logging in for the first
time is **change the default username and password**! It is very easy to do
that. Just go to the Users menu, click on the OpenPLC User and change the
information as you like.

![](/runtime/img/edituser.webp)

Once you save the changes you will be prompted to login again. Just login with
your new credentials and you will be good to go!
