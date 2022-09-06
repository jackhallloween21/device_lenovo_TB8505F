#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/lenovo/TB8505F

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtb.img:$(OUT_DIR)/target/product/$(DEVICE_NAME)/dtb.img \
    $(LOCAL_PATH)/prebuilt/dtbo.img:$(OUT_DIR)/target/product/$(DEVICE_NAME)/dtbo.img 
