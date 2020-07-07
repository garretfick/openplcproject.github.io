---
layout: inset
title: Timer Off
---

## Introduction

This function block delays setting the output `Q` to `FALSE` for a fixed period of time `PT` after the input `IN` becomes `FALSE`. When the input is `TRUE`, the output is `TRUE` and the elapsed time counter `ET` is zero. When the input becomes `FALSE`, `ET` increments until the `PT` value is reached, at which point the output becomes `FALSE`.


