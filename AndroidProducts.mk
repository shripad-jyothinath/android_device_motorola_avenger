#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_marvel.mk \
    $(LOCAL_DIR)/evolution_marvel.mk \
    $(LOCAL_DIR)/orangefox_marvel.mk \
    $(LOCAL_DIR)/lineage_avenger.mk \
    $(LOCAL_DIR)/evolution_avenger.mk \
    $(LOCAL_DIR)/orangefox_avenger.mk

COMMON_LUNCH_CHOICES := \
    lineage_marvel-user \
    lineage_marvel-userdebug \
    lineage_marvel-eng \
    evolution_marvel-user \
    evolution_marvel-userdebug \
    evolution_marvel-eng \
    orangefox_marvel-eng \
    orangefox_marvel-userdebug \
    lineage_avenger-userdebug \
    evolution_avenger-userdebug \
    orangefox_avenger-eng
