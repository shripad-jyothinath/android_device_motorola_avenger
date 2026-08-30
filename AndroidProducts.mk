#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_avenger.mk \
    $(LOCAL_DIR)/evolution_avenger.mk \
    $(LOCAL_DIR)/orangefox_avenger.mk

COMMON_LUNCH_CHOICES := \
    lineage_avenger-user \
    lineage_avenger-userdebug \
    lineage_avenger-eng \
    evolution_avenger-user \
    evolution_avenger-userdebug \
    evolution_avenger-eng \
    orangefox_avenger-eng \
    orangefox_avenger-userdebug
