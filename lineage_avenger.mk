#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from LineageOS product configuration
$(call inherit-product-if-exists, vendor/lineage/config/common_full_phone.mk)

# Inherit from device configuration
$(call inherit-product, device/motorola/avenger/device.mk)

# Product metadata
PRODUCT_NAME := lineage_avenger
PRODUCT_DEVICE := avenger
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 70 fusion
PRODUCT_MANUFACTURER := motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Build fingerprint and description
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=avenger_g \
    TARGET_DEVICE=avenger \
    TARGET_PRODUCT=avenger
