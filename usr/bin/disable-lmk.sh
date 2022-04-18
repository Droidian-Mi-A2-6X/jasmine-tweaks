#!/usr/bin/env bash
echo 0 > /sys/module/lowmemorykiller/parameters/enable_lmk
echo 0 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
