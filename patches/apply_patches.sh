#!/usr/bin/env bash
#
# Script to apply required ROM patches for Motorola Edge 70 Fusion (marvel)
#

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOP="$(realpath "${DIR}/../../..")"

echo "==> Checking and applying marvel ROM patches..."

# 1. hardware/lineage/interfaces
if [ -d "${TOP}/hardware/lineage/interfaces" ]; then
    if git -C "${TOP}/hardware/lineage/interfaces" apply --check "${DIR}/0001-interfaces-add-UDFPS-HBM-service.patch" 2>/dev/null; then
        git -C "${TOP}/hardware/lineage/interfaces" apply "${DIR}/0001-interfaces-add-UDFPS-HBM-service.patch"
        echo "  ✓ Applied hardware/lineage/interfaces UDFPS patch"
    else
        echo "  - hardware/lineage/interfaces patch already applied"
    fi
fi

# 2. frameworks/base
if [ -d "${TOP}/frameworks/base" ]; then
    if git -C "${TOP}/frameworks/base" apply --check "${DIR}/0002-frameworks-base-SystemUI-add-optional-UDFPS-HBM-service.patch" 2>/dev/null; then
        git -C "${TOP}/frameworks/base" apply "${DIR}/0002-frameworks-base-SystemUI-add-optional-UDFPS-HBM-service.patch"
        echo "  ✓ Applied frameworks/base SystemUI UDFPS patch"
    else
        echo "  - frameworks/base patch already applied"
    fi
fi

# 3. bionic
if [ -d "${TOP}/bionic" ]; then
    if git -C "${TOP}/bionic" apply --check "${DIR}/0003-bionic-include-system-properties.patch" 2>/dev/null; then
        git -C "${TOP}/bionic" apply "${DIR}/0003-bionic-include-system-properties.patch"
        echo "  ✓ Applied bionic system properties patch"
    else
        echo "  - bionic patch already applied"
    fi
fi

# 4. vendor/lineage
if [ -d "${TOP}/vendor/lineage" ]; then
    if git -C "${TOP}/vendor/lineage" apply --check "${DIR}/0004-vendor-lineage-soong-extract-prebuilt-headers.patch" 2>/dev/null; then
        git -C "${TOP}/vendor/lineage" apply "${DIR}/0004-vendor-lineage-soong-extract-prebuilt-headers.patch"
        echo "  ✓ Applied vendor/lineage soong prebuilt headers patch"
    else
        echo "  - vendor/lineage patch already applied"
    fi
fi

echo "==> Done!"
