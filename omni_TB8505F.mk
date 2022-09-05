# Copyright (C) 2022 s0umyaz aka Soumyadeep Ghosh
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit from akita_row_wifi device
$(call inherit-product, device/lenovo/TB8505F/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product-if-exists, vendor/twrp/config/gsm.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := TB8505F
#PRODUCT_NAME := twrp_TB8505F
PRODUCT_NAME := omni_TB8505F
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := Lenovo M8 HD
PRODUCT_MANUFACTURER := lenovo
