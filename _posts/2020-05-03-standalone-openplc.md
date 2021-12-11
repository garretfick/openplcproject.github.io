---
layout: post
title:  Running OpenPLC without a Webserver
date:   2020-05-03 12:00:00 - 5:00
categories: general
author: Garret Fick
gravatar_hash: dd8003b403e5aff6a8ce41f3c150b810
---

OpenPLC normally runs with and integrated web server and is perhaps one of the
defining characteristics of OpenPLC. The webserver makes deploying new
applications and new versions of applications straightforward. For many
applications, it is a simple way to get your application running.

Other applications may have no use for the web server and the web server
therefore represents an unnecessary and undesired attack surface.

In prior versions of OpenPLC, the webserver was essential. Not only was it a
means to change and monitor an application, it also served the purpose of
configuring the application at runtime, for example, starting the Modbus
server.

Recent changes to OpenPLC have eliminated that limitation, and the purpose
of this post is to describe the changes that were made to OpenPLC to enable
running in a standalone mode without the webserver.
