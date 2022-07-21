#
# Copyright (C) 2018-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from sdm660-common
include device/xiaomi/sdm660-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/platina

# Assert
TARGET_OTA_ASSERT_DEVICE := platina

# Boot animation
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# Build
BUILD_BROKEN_DUP_RULES := true

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/c0c4000.sdhci
TARGET_KERNEL_CONFIG += vendor/xiaomi/platina.config

# Manifest
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest.xml

# Partitions
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
#BOARD_VENDORIMAGE_PARTITION_SIZE := 838860800

BOARD_SUPER_PARTITION_BLOCK_DEVICES := vendor system
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 838860800
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3221225472
BOARD_SUPER_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) )
BOARD_SUPER_PARTITION_GROUPS := platina_dynamic_partitions
BOARD_PLATINA_DYNAMIC_PARTITIONS_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304 )
BOARD_PLATINA_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Security patch level
VENDOR_SECURITY_PATCH := 2020-08-01

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Vendor init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_platina
TARGET_RECOVERY_DEVICE_MODULES := libinit_platina

# Inherit the proprietary files
include vendor/xiaomi/platina/BoardConfigVendor.mk
