#
# Copyright (C) 2018 The LineageOS Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common msm8956-common
-include device/xiaomi/msm8956-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/hydrogen

# Assertions
TARGET_OTA_ASSERT_DEVICE := hydrogen

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/vendor/lib64/lib-imsvt.so|libshims_ims.so \
    /system/vendor/lib64/libizat_core.so|libshims_get_process_name.so \
    /system/vendor/lib64/libril-qc-qmi-1.so|rild_socket.so

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Filesystem
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26705099776 # 26705116160 - 16384

# Kernel
TARGET_KERNEL_CONFIG := msm8976_user_defconfig

WITH_LINEAGE_CHARGER := false

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Sepolicy
#BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Tap-to-Wake
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

# inherit from the proprietary version
-include vendor/xiaomi/hydrogen/BoardConfigVendor.mk
