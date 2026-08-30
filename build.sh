#!/usr/bin/env bash
#
# Evolution X Build Script for Motorola Edge 70 Fusion (avenger)
# Maintainer: Shripad
#

set -e

DEVICE="avenger"

echo "========================================================"
echo "  Building Evolution X for Moto Edge 70 Fusion (${DEVICE})"
echo "  Maintainer: Shripad"
echo "========================================================"

# Enable Ccache
export USE_CCACHE=1
export CCACHE_EXEC=$(which ccache 2>/dev/null || echo "/usr/bin/ccache")
export CCACHE_DIR="${HOME}/.ccache"
ccache -M 50G 2>/dev/null || true

# Set Build Flags
export EVO_MAINTAINER="Shripad"
export ALLOW_MISSING_DEPENDENCIES=true
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES=true

# Check if environment is already setup; source envsetup.sh only if needed
if [ -z "${ANDROID_BUILD_TOP}" ] || ! command -v lunch &>/dev/null; then
    if [ -f "build/envsetup.sh" ]; then
        echo "[+] Initializing build environment (sourcing build/envsetup.sh)..."
        source build/envsetup.sh
    else
        echo "[-] Error: Run this script from the root of your Android source directory!"
        exit 1
    fi
else
    echo "[+] Build environment already initialized."
fi

START_TIME=$(date +%s)

echo "[+] Setting lunch target..."
lunch "evolution_${DEVICE}-userdebug"

echo "[+] Starting Evolution X compilation..."
m evolution -j$(nproc --all)

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "========================================================"
echo "  Evolution X Build Completed Successfully!"
echo "  Total Time: $((DURATION / 60)) min $((DURATION % 60)) sec"
echo "  Output Directory: out/target/product/${DEVICE}/"
echo "========================================================"
