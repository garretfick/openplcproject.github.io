---
layout: inset
title: Timer On
---

## Introduction

This function block delays setting the output `Q` to `TRUE` for a fixed period of time `PT` after the input `IN` is set to `TRUE`. When the input becomes `TRUE`, the elapsed time counter `ET` resets to zero and increments until the `PT` value is reached, at which point the output becomes `TRUE`. If the input is `FALSE` the output immediately becomes `FALSE`.

