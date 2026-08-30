#
# Copyright (C) 2026 The Evolution X Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from Evolution X product configuration
$(call inherit-product-if-exists, vendor/evolution/config/common_full_phone.mk)

# Inherit from device configuration
$(call inherit-product, device/motorola/avenger/device.mk)

# Product metadata
PRODUCT_NAME := evolution_marvel
PRODUCT_DEVICE := marvel
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 70 fusion
PRODUCT_MANUFACTURER := motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola

EVO_BUILD_TYPE := UNOFFICIAL
EVO_MAINTAINER := Shripad
