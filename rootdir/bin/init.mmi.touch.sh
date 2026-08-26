#!/vendor/bin/sh
#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Initialize touch gestures and panel parameters
if [ -d "/sys/class/touchscreen/primary" ]; then
    echo 1 > /sys/class/touchscreen/primary/gesture 2>/dev/null
fi

exit 0
