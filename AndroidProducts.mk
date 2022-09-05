# Copyright (C) 2022 s0umyaz aka Soumyadeep Ghosh
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/omni_TB8505F.mk
    $(LOCAL_DIR)/twrp_TB8505F.mk

COMMON_LUNCH_CHOICES := \
    omni_TB8505F-eng \
    twrp_TB8505F-eng
