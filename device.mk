#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/avenger

# Boot animation
TARGET_SCREEN_HEIGHT := 2712
TARGET_SCREEN_WIDTH := 1220
TARGET_SCREEN_DENSITY := 440

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 440dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_SHIPPING_API_LEVEL := 36
PRODUCT_CHARACTERISTICS := nosdcard

# Inherit from sm7750-common
$(call inherit-product, device/motorola/sm7750-common/common.mk)

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
    AvengerFrameworksOverlay \
    AvengerSystemUIOverlay \
    roadstr-udfps-hbm

# Permissions & Hardware Features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Keylayout (Power, Volume Buttons, Assistant)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# SurfaceFlinger Display & Touch Boost Properties
PRODUCT_VENDOR_PROPERTIES += \
    ro.surface_flinger.touch_boost_across_groups=true \
    ro.surface_flinger.touch_boost_refresh_rate=90 \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.set_idle_timer_ms=1100 \
    ro.surface_flinger.set_touch_timer_ms=1000

# Inherit proprietary blobs from vendor tree
$(call inherit-product-if-exists, vendor/motorola/avenger/avenger-vendor.mk)
