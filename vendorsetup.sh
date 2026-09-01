#!/bin/bash
#
# Copyright (C) 2026 The OrangeFox Recovery Project
# SPDX-License-Identifier: Apache-2.0
#
# Automated OrangeFox Build Environment Setup for Motorola Edge 70 Fusion (marvel)
#

# Core OrangeFox Identity
export FOX_VERSION="R12.1"
export FOX_BUILD_TYPE="Unofficial"
export OF_MAINTAINER="Shripad"

# Device Identifiers & Assert Overrides
export TARGET_DEVICE_ALT="avenger,marvel,XT2605,XT2605-1,XT2605-2,XT2605-3,XT2605-4"
export FOX_TARGET_DEVICES="avenger,marvel,XT2605,XT2605-1,XT2605-2,XT2605-3,XT2605-4"

# Display & UI Geometry
export OF_SCREEN_H=2712
export OF_STATUS_H=96
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_CLOCK_POS=1
export OF_USE_GREEN_LED=0
export OF_FLASHLIGHT_ENABLE=0
export OF_HIDE_NOTCH=1
export OF_ALLOW_DISABLE_NAVBAR=0

# Magisk, Root, & Tools
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export FOX_ENABLE_APP_MANAGER=1
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_DONT_KEEP_LOG_HISTORY=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_NO_RELOAD_AFTER_DECRYPTION=1
export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
export OF_RUN_POST_FORMAT_PROCESS=1
export OF_QUICK_BACKUP_LIST="/boot;/init_boot;/dtbo;/vendor_boot;/data;"

# Build Engine & Toolchain Settings
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_DELETE_AROMAFM=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export OF_USE_TWRP_SAR_DETECT=1
export OF_CLASSIC_LEAD=1
