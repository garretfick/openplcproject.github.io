---
layout: inset-dev
title: Configuration
--- 

Many configuration capabilities for OpenPLC are available through the web
interface. However, some capabilities can only be configured through a
configuration file that the OpenPLC runtime reads on startup. This section
gives an overview of this configuration. Further details are described
as comments in the configuration file.

When the OpenPLC, it reads the configuration file `config.ini` located in
the `etc`. This file does not exist by default. You can use the example
`config.example.ini` as a template.

The file is separated into sections and allows you to configure details about:

* logging
* Modbus slave
* Modbus master
* Persistent storage
* DNP3 outstation
* Interactive server

You can also use this file entirely to enable or disable these services.

## Running Standalone

For some applications, you may wish to disable the web interface. For such
applications, you can use the `config.ini` to provide all configuration
information your application instance.

You should then:

* disable the interactive server in the `interactive` section - note that
  this disables communication with the webserver
* provide the path to the configuration file when you start the runtime
