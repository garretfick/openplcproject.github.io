---
layout: inset
title: PLC Addressing
--- 

PLC applications normally (or always) interact with the external world
through one or more communication protocols. When designing your PLC
application, you decide which variables are available for use by communication
protocols by labeling the variable with a PLC address, for example
`%IX10.1` or `%QW5`. PLC addressing schemes normally depend on the
runtime and manufacturer. This section describes PLC address support
in OpenPLC.

PLC addresses are constructed as a union of 4 ordered parts:

1. a leading `%` symbol
2. a storage class (direction) indication
3. a data size indication
4. a hierarchical address

Formally, a PLC address can be expressed in Backus Naur Form.

```
<plc-address> ::= "%" <storage-class> <data-size> <hierarchical-address>

<storage-class> ::= "I" | "Q" | "M"
<data-size> ::= "X" | "B" | "W" | "D" | "L"
<hierarchical-address> ::= <number> | <number> "." <oct-digit>

<number> ::= <digit> | <number> <digit>
<digit> ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
<oct-digit> ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7"
```

In OpenPLC, the storage class is a "hint" as to the usage. The precise
meaning depends on implementation of a particular communication module.
Generally, the storage class has the following interpretation:

* `I` - inputs
* `Q` - outputs
* `M` - memory

Communications modules normally require data with a pre-defined number of bits.
Different elementary data types have the same data size. The permitted data
size depends on the particular communication module. The elementary data types
have the following data sizes:

<div class="table-wrapper" markdown="block">

| `<data-size>` | Common Name | Number of Bits | Elementary Data Types    |
|---------------|-------------|----------------|--------------------------|
| `X`           | Bit         | 1              | `BOOL`                   |
| `B`           | Byte        | 8              | `BYTE`, `SINT`, `USINT`  |
| `W`           | Word        | 16             | `WORD`, `INT`, `UINT`    |
| `D`           | Double word | 32             | `DWORD`, `DINT`, `UDINT`, `FLOAT`  |
| `L`           | Long word   | 64             | `LWORD`, `LINT`, `ULINT`, `DOUBLE` |

</div>

The hierarchical address differentiates otherwise equivalent PLC addresses.

Bit (`X`) PLC addresses have a two-part hierarchical address. The least
significant part (right-most) can be interpreted as a position in a byte and
must be in the range 0 to 7. The most significant part (left-most) must be no
more than 1023. Parts are separated by a single period (`.`).

Data sizes other than `X` have a one-part hierarchical address. They must not
contain a period (`.`) and must be no more than 1023.

{%include tip.html content="The limitation for the maximum hierarchical
address index will be relaxed in the future." %}
