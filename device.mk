#
# Copyright (C) 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/marvel

# Boot animation
TARGET_SCREEN_HEIGHT := 2712
TARGET_SCREEN_WIDTH := 1220
TARGET_SCREEN_DENSITY := 440

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 440dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_SHIPPING_API_LEVEL ?= 36
PRODUCT_CHARACTERISTICS := nosdcard

# Inherit device common definitions
$(call inherit-product, $(DEVICE_PATH)/common.mk)

# Touchscreen double-tap wake & gestures
$(call soong_config_set_bool,moto_sensors,legacy_double_tap,true)

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/idc/double-tap.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/double-tap.idc \
    $(DEVICE_PATH)/configs/keylayout/double-tap.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/double-tap.kl

# Runtime Resource Overlays (RRO) & Framework Packages
PRODUCT_PACKAGES += \
    moto-framework \
    moto-res \
    RefreshRateDefaults \
    MarvelFrameworksOverlay \
    MarvelSystemUIOverlay

# Permissions & Hardware Features
# Note: camera/fingerprint/touch permissions are inherited from common.mk

# Keylayout (Power, Volume Buttons, Assistant)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# SurfaceFlinger Display & Touch Boost Properties
# Note: ro.surface_flinger.* props are defined in vendor.prop; only build-time overrides here
PRODUCT_VENDOR_PROPERTIES += \
    ro.surface_flinger.touch_boost_across_groups=true \
    ro.surface_flinger.touch_boost_refresh_rate=90 \
    ro.surface_flinger.set_idle_timer_ms=1100

# Motorola Camera Extensions & Multi-Lens Whitelist
PRODUCT_PRODUCT_PROPERTIES += \
    vendor.camera.aux.packagelist=com.motorola.camera5,com.motorola.camera4,com.motorola.cameraone,com.motorola.camera2 \
    persist.vendor.camera.privapp.list=com.motorola.camera5,com.motorola.camera4

PRODUCT_PACKAGES += \
    com.motorola.camera.extensions

# Inherit proprietary blobs from vendor tree
$(call inherit-product-if-exists, vendor/motorola/marvel/marvel-vendor.mk)
