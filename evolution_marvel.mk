#
# Copyright (C) 2026 The Evolution X Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from Evolution X product configuration
$(call inherit-product-if-exists, vendor/evolution/config/common_full_phone.mk)
$(call inherit-product-if-exists, vendor/lineage/config/common_full_phone.mk)

# Inherit from device configuration
$(call inherit-product, device/motorola/marvel/device.mk)

# Product metadata
PRODUCT_NAME := evolution_marvel
PRODUCT_DEVICE := marvel
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 70 fusion
PRODUCT_MANUFACTURER := motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola

EVO_BUILD_TYPE := UNOFFICIAL
EVO_MAINTAINER := Shripad

# Evolution X Features & Customizations
TARGET_BOOT_ANIMATION_RES := 1220
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_FACE_UNLOCK_SUPPORTED := true
EXTRA_UDFPS_ANIMATIONS := true
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_CALL_RECORDING := true

# Pixel Experience & Google Features
PRODUCT_PRODUCT_PROPERTIES += \
    ro.evolution.device=marvel \
    ro.evolution.maintainer=Shripad \
    ro.opa.eligible_device=true \
    ro.camera.camera5.enabled=true

