---
layout: inset
title: Counter Up
---

## Introduction

The up-counter can be used to count the number of rising edge `FALSE` to `TRUE` transitions of the preceding logic and signal when a count has reached a maximum value. Each time the input `CU` is set to `TRUE`, the counter `CV` is incremented by 1, provided that `CV` is less than the maximum value `PV`. The output `Q` is set to `TRUE` when `CV` is greater than or equal to `PV`. `CV` is initialized to 0 when the application starts, and is reset to 0 when `R` becomes `TRUE`.


