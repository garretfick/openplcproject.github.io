---
layout: inset
title: Persistent Storage
--- 

OpenPLC can be configured to use persistent storage. Persistent storage
periodically writes certain [PLC addresses](/reference/plc-addressing) to disk.
When the runtime
starts, OpenPLC initializes these PLC addresses to the last written
value prior to executing the first cycle.

Persistent storage can be used to state information locally.

Persistent storage stores all values that are marked as "memory storage",
that is, with the `M` storage class. Other storage classes (namely `I` and
`Q`) are not stored.

{% include important.html content="When enabled, persistent storage
periodically writes data to disk. Hardware that utilizes a flash-based
drive have limited write cycles; writing to persistent storage
will reduce the life-time of the drive. If your application requires
persistent storage, you may need to choose an appropriate write interval
based on trade-offs between freshness of data and write cycles." %}

## Configuring Persistent Storage

Persistent storage is disabled by default. You can enable persistent
storage either via:

* web-based configuration
* `config.ini` configuration file in the `pstorage` section

## Changing Programs

{%include development.html %}

The persistent storage file contains a signature derived from the list of
PLC addresses.

Changing the running program may change the signature and prevent the
application from loading the persistent storage.
