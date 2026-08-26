# LineageOS Device Tree for Motorola Edge 70 Fusion (`avenger`)

This repository provides the AOSP / LineageOS device tree configuration for the **Motorola Edge 70 Fusion** (Model: `XT2605`).

## Device Specifications

| Feature | Specification |
| :--- | :--- |
| **Chipset** | Qualcomm Snapdragon 7s Gen 4 (`sm7635`) |
| **CPU** | Octa-core Kryo architecture |
| **GPU** | Qualcomm Adreno GPU |
| **Display** | 6.78-inch 1.5K Extreme AMOLED, 144Hz, Quad-Curved |
| **Battery** | 7,000 mAh Silicon-Carbon, 68W TurboPower |
| **Cameras** | 50 MP (Sony Lytia 710, OIS) + 13 MP (Ultra-Wide/Macro) + 32 MP Front |
| **Storage / RAM** | 8GB/12GB LPDDR5X + 128GB/256GB UFS |
| **Biometrics** | Optical In-Display Fingerprint Sensor |
| **Android Version** | Stock Android 16 (Hello UI) -> LineageOS |

---

## Repository Structure

```
device/motorola/avenger/
├── Android.bp                       # Soong namespace and Blueprint targets
├── Android.mk                       # Legacy makefile hook
├── AndroidProducts.mk               # Target definitions (lineage_avenger)
├── BoardConfig.mk                   # Architecture, dynamic partition limits, AVB, GKI
├── device.mk                        # Hardware permissions, copy files, system props
├── lineage_avenger.mk               # LineageOS product configuration
├── extract-files.sh                 # Vendor blob extraction script
├── setup-makefiles.sh               # Vendor tree makefile generator
├── proprietary-files.txt            # Manifest of closed-source vendor binaries
├── configs/                         # Audio, GPS, Wi-Fi, Keylayout configs
├── rootdir/                         # fstab.qcom and device init scripts
├── rro_overlays/                    # Runtime resource overlays (144Hz, 1.5K display)
├── sepolicy/                        # SELinux vendor context rules
└── vintf/                           # Device VINTF HAL manifest
```

---

## How to Build

### 1. Extract Vendor Blobs
Connect your device with ADB debugging enabled, or point to an extracted stock firmware folder:
```bash
./extract-files.sh /path/to/extracted/firmware
```

### 2. Build the ROM
```bash
source build/envsetup.sh
lunch lineage_avenger-userdebug
m bacon
```
