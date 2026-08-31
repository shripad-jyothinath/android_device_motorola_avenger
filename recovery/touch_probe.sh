#!/system/bin/sh
#
# Copyright (C) 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# Motorola Touchscreen Probe Script for Edge 70 Fusion (marvel)
#

# Probe standard touchscreen driver modules
insmod /vendor/lib/modules/goodix_core.ko 2>/dev/null || true
insmod /vendor/lib/modules/focaltech_touch.ko 2>/dev/null || true
insmod /vendor/lib/modules/novatek_touch.ko 2>/dev/null || true

exit 0
