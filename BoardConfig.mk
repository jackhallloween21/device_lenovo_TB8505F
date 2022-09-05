# Copyright (C) 2022 s0umyaz aka Soumyadeep Ghosh
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lenovo/TB8505F

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := TB8505F

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432 
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4085252096
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 838860800
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_COPY_OUT_VENDOR := vendor
BOARD_USES_METADATA_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_BUILD_SYSTEM_ROOT_IMAGE := true


# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop
#TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.mt6761.rc
TARGET_KERNEL_SOURCE := kernel/lenovo/TB8505F
TARGET_KERNEL_CONFIG := akita_row_wifi_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
BOARD_BOOTIMG_HEADER_VERSION := 2
#BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00e88000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_DTB_OFFSET := 0x07808000
BOARD_DTB_SIZE := 99298
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --recovery_dtbo $(BOARD_PREBUILT_DTBOIMAGE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
        
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# MTK Hardware
# BOARD_USES_MTK_HARDWARE := true
# BOARD_HAS_MTK_HARDWARE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := akita_row_wifi
TARGET_BOARD_PLATFORM := mt6761
TARGET_NO_BOOTLOADER := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2025-12-31
VENDOR_SECURITY_PATCH := 2025-12-31
PLATFORM_VERSION := 12

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1


# TWRP Basic Configuration
TW_DEVICE_VERSION := s0umyaz
TW_THEME := portrait_hdpi
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Recovery Stuff
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab  
RECOVERY_SDCARD_ON_DATA := true

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice \
    ashmemd_aidl_interface-cpp \
    libashmemd_client

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so

# Making the recovery image smaller
# BOARD_HAS_NO_REAL_SDCARD := true

# TWRP Advanced Configuration
TW_DEFAULT_LANGUAGE := en
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 70
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true

# Decryption support for /data
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true


# use SHRP Stuff

SHRP_MAINTAINER := carlodeeCrypton
SHRP_DEVICE_CODE := TB8505F
SHRP_PATH := device/lenovo/TB8505F
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A_Only
SHRP_NOTCH := false
SHRP_EDL_MODE := 0
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_FLASH := 0
SHRP_DARK := true
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_EXPRESS := true

# USE SHRP Addons
# SHRP Addon 1
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true
SHRP_EXTERNAL_ADDON_PATH := "device/lenovo/akita_row_wifi/addon/"
SHRP_EXTERNAL_ADDON_1_NAME := "SELinux Permissiver"
SHRP_EXTERNAL_ADDON_1_INFO := "Makes SELinux Permissive"
SHRP_EXTERNAL_ADDON_1_FILENAME := "permissiver.zip"
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Flashed Successfully"

# SHRP Addon 2
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true
SHRP_EXTERNAL_ADDON_2_NAME := "SELinux Enforcer"
SHRP_EXTERNAL_ADDON_2_INFO := "Reverts Back to Enforcing SELinux"
SHRP_EXTERNAL_ADDON_2_FILENAME := "enforcer.zip"
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := "Flashed Successfully"

# SHRP Addon 3
SHRP_INC_IN_REC_EXTERNAL_ADDON_3 := true
SHRP_EXTERNAL_ADDON_3_NAME := "Magisk-V25.2"
SHRP_EXTERNAL_ADDON_3_INFO := "Flash It To Get Root Access"
SHRP_EXTERNAL_ADDON_3_FILENAME := "Magisk-V25.2.zip"
SHRP_EXTERNAL_ADDON_3_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_3_SUCCESSFUL_TEXT := "Installed"
