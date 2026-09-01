# OrangeFox Recovery Project Device Tree for Motorola Edge 70 Fusion (`marvel`)

<p align="center">
  <img src="assets/device.jpg" alt="Motorola Edge 70 Fusion" width="360"/>
</p>

This repository contains the **OrangeFox Recovery Project (R12.1)** device tree for the **Motorola Edge 70 Fusion** (Codename: `marvel` / `avenger`, Model: `XT2605` series).

---

## 📱 Device Specifications

| Feature | Specification |
| :--- | :--- |
| **SoC** | Qualcomm Snapdragon 7s Gen 3 (`SM7750` / `sm7635`) |
| **CPU** | Octa-core Kryo architecture |
| **GPU** | Qualcomm Adreno GPU |
| **Display** | 6.78-inch 1.5K OLED, 144Hz, Quad-Curved |
| **Battery** | 7,000 mAh Silicon-Carbon, 68W TurboPower |
| **Storage / RAM** | 8GB/12GB LPDDR5X + 128GB/256GB/512GB UFS |
| **Android Version** | Android 15 / 16 (GKI 6.6, Header v4) |
| **Partition Scheme** | Dynamic Partitions (`super`), Virtual A/B OTA |

---

## 🛠️ How to Build OrangeFox Recovery

### 1. Initialize the Minimal OrangeFox Manifest
```bash
repo init --depth=1 -u https://gitlab.com/OrangeFox/manifest.git -b fox_12.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 2. Clone Device & Vendor Trees
```bash
git clone https://github.com/shripad-jyothinath/android_device_motorola_avenger.git -b ofox device/motorola/avenger
git clone https://github.com/shripad-jyothinath/android_vendor_motorola_avenger.git -b ofox vendor/motorola/avenger
```

### 3. Compile
```bash
source build/envsetup.sh
lunch orangefox_marvel-eng
m recoveryimage -j$(nproc --all)
```

---

## ⚡ Flashing Guide

```bash
# Reboot to bootloader
adb reboot bootloader

# Flash recovery image
fastboot flash recovery recovery_marvel.img

# Reboot into OrangeFox
fastboot reboot recovery
```

---

**Maintainer:** Shripad (@shripad-jyothinath)
