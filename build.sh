#!/usr/bin/env bash
#
# Evolution X All-In-One Master Build Script
# Device: Motorola Edge 70 Fusion (marvel)
# Maintainer: Shripad
#

set -eo pipefail

DEVICE="marvel"

echo "================================================================="
echo "  🚀 Evolution X Automated Build Pipeline for ${DEVICE}"
echo "  Maintainer: Shripad"
echo "  Architecture: SM7635 (volcano) | Android 17 (cnb)"
echo "================================================================="

# 1. Ccache Setup
echo "[1/5] Configuring Ccache (75GB)..."
export USE_CCACHE=1
export CCACHE_EXEC=$(which ccache 2>/dev/null || echo "/usr/bin/ccache")
export CCACHE_DIR="${HOME}/.ccache"
ccache -M 75G 2>/dev/null || true

# 2. Build Flags
echo "[2/5] Setting Evolution X environment variables..."
export EVO_BUILD_TYPE="UNOFFICIAL"
export EVO_MAINTAINER="Shripad"
export ALLOW_MISSING_DEPENDENCIES=true
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES=true

# 3. Source Build Environment
echo "[3/5] Initializing build environment (build/envsetup.sh)..."
if [ ! -f "build/envsetup.sh" ]; then
    echo "[-] Error: Run this script from the root of your Android source directory!"
    exit 1
fi
source build/envsetup.sh

# 4. Breakfast (device selection + env setup)
echo "[4/5] Running breakfast for ${DEVICE}..."
breakfast "${DEVICE}"

# 5. Compilation
START_TIME=$(date +%s)
echo "[5/5] Launching Evolution X via brunch..."
brunch "${DEVICE}" 2>&1 | tee "build_${DEVICE}.log"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "================================================================="
echo "  🎉 Evolution X Build Completed Successfully!"
echo "  ⏱️  Total Time: $((DURATION / 60)) min $((DURATION % 60)) sec"
echo "  📦 Output Path: out/target/product/${DEVICE}/"

ZIP_FILE=$(find "out/target/product/${DEVICE}/" -name "evolution_${DEVICE}-*.zip" -type f -printf "%T@ %p\n" 2>/dev/null | sort -nr | head -n1 | cut -d' ' -f2-)
if [ -n "${ZIP_FILE}" ]; then
    echo "  📁 ROM Zip: $(basename "${ZIP_FILE}")"
    sha256sum "${ZIP_FILE}" > "${ZIP_FILE}.sha256"
    echo "  🔒 SHA256: $(cat "${ZIP_FILE}.sha256" | awk '{print $1}')"
fi
echo "================================================================="

