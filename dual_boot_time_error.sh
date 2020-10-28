#!/bin/bash

# Solves the time error on Windows//Linux when using a dual boot system
# This make Linux use local storaged time, like Windows
timedatectl set-local-rtc 1 --adjust-system-clock
