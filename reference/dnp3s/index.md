---
layout: inset-dev
title: DNP3 Outstation Configuration
--- 

OpenPLC can be configured as a DNP3 outstation (slave). An outstation is
typically controlled by a master, and performs local measurement and control.
The master may send control requests to the outstation and the outstation
reports the status of controls and measurements back to the master.

{% include tip.html content="DNP3 outstation is not supported on Windows." %}

## Configuring DNP3 Outstation

To use OpenPLC as a DNP3 outstation, you must:

* define a mapping between located variables in your PLC application and
  DNP3 points
* define DNP3 connection details

This information is defined in the `config.ini` configuration file in the
`dnp3s` section.

## Binding DNP3 Objects to PLC Located Variables

OpenPLC supports a flexible binding between PLC located variables and DNP3
points.

Each `bind_location` key defines a one-way binding between a PLC located
variable and DNP3 point. The direction of the binding depends on the DNP3
group (described below).

The value of `bind_location` is an order-sensitive, comma-separated triple
defining the name of the located variable, the DNP3 group and DNP3 index.

```
[dnp3s]
enabled = true
bind_location = name:%IX1.0,group:12,index:0
bind_location = name:%QW1.0,group:20,index:3
```

The above example defines binds two located variables to two DNP3 points.

### Binary Output Command (Group 12)

Binary output commands are used to send control requests from the master to
the OpenPLC outstation.
OpenPLC supports the following variations for the Control Relay Output Block
group:

* Variation 1: Control relay output block

Binary output commands can be bound to `BOOL` located variables. The located
variable sub-index must be 0. For example, the following is a valid binding:

```
bind_location = name:%IX1.0,group:12,index:0
````

whereas binding to `%IX1.1` is not valid.

The DNP3 binary output command supports several values. The DNP3 value
`LATCH_ON` is mapped to `TRUE`. Any other value is mapped to `FALSE`.

### Analog Output (Group 41)

Analog output commands are used to send analog (numeric) data from the master
to the OpenPLC outstation.
OpenPLC supports the following variations of the Analog Output group:

* Variation 1: 32-bit integer
* Variation 2: 16-bit integer
* Variation 3: single precision floating point
* Variation 4: double precision floating point

Analog outputs can be bound to the following PLC types: `BYTE`, `SINT`,
`USINT`, `INT`, `UINT`, `WORD`, `DINT`, `UDINT`, `DWORD`, `REAL`, `LREAL`,
`LWORD`, `LINT`, `ULINT`.

{% include important.html content="In OpenPLC DNP3 object values are mapped to
PLC located variables through
a double precision floating point value. This results in loss of precision
for 32-bit integral values." %}

{% include important.html content="PLC located variables are updated via a
static cast from double to the
desired PLC type. The mapped value is undefined if the DNP3 object value is
out of range for the mapped PLC located variable. For example, 1e9 is
within the range of DNP3 object group 41 variation 1 (32-bit signed integer) but
it out of range of IEC type `SINT` (8-bit signed integer). The mapping of
the values is undefined. It is your responsibility to ensure values written
via DNP3 are in range for the destination type." %}

### Binary Input (Group 1) and Binary Output Status (Group 10)

Binary input and binary output status are used to send Boolean information
from the OpenPLC outstation to the master. `BOOL` located variables an be
bound to binary input and binary output status points.

{% include tip.html content="Normally, binary output status values are
associated with a binary
output command (group 12). OpenPLC does not enforce
such a mapping. If this is desired, you must implement this in your IEC
application." %}

### Analog Input (Group 30) and Analog Output Status (Group 40)

Analog input and analog output status are used to send floating point
information from the OpenPLC outstation to the master.

`BYTE`, `SINT`,
`USINT`, `INT`, `UINT`, `WORD`, `DINT`, `UDINT`, `DWORD`, `REAL`, `LREAL`,
`LWORD`, `LINT`, `ULINT` located variables can be bound to analog input and
analog output status points.

{% include tip.html content="Normally, analog output status values are
associated with an analog output
(group 41). OpenPLC does not enforce such a mapping. If this is desired, you
must implement this in your IEC
application." %}

### Counter (Group 20) and Frozen Counter (Group 21)

Counter and frozen counter are used to send fixed-point information
information from the OpenPLC outstation to the master.

`BYTE`, `SINT`,
`USINT`, `INT`, `UINT`, `WORD`, `DINT`, `UDINT`, `DWORD`, `REAL`, `LREAL`,
`LWORD`, `LINT`, `ULINT` located variables can be bound to counter and frozen
counter points.
