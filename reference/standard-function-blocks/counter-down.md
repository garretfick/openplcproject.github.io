---
layout: inset
title: Counter Down
---

## Introduction

The down-counter can be used to signal when a count has reached zero after counting down from a preset value `PV`. 
The counter `CV` is initialized to `PV` when the load command `LD` is `TRUE`. 
If the input `CD` has a rising edge `FALSE` to `TRUE` transition, `CV` is decremented by 1, provided that `CV` is greater than 0. 
The output `Q` is set to `TRUE` when `CV` is less than or equal to 0.


