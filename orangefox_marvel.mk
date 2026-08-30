#
# Copyright (C) 2026 The OrangeFox Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

# Recovery API level override for Android 12.1 base
PRODUCT_SHIPPING_API_LEVEL := 32

# Inherit from standard product configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device configuration
$(call inherit-product, device/motorola/avenger/device.mk)

# Product metadata
PRODUCT_NAME := orangefox_marvel
PRODUCT_DEVICE := marvel
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 70 fusion
PRODUCT_MANUFACTURER := motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola
