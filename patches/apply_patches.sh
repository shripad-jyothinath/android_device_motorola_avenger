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

echo "==> Done!"
