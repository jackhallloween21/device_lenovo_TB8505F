# Copyright (C) 2022 s0umyaz aka Soumyadeep Ghosh
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

RECOVERY_API_VERSION := 3
RECOVERY_FSTAB_VERSION := 2

ifeq ($(TARGET_DEVICE),TB8505F)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
