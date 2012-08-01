# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for magiclego4x12 hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

ifeq ($(WIRELESS_MODULE),bcm4330)
# WiFi
SRC := $(KERNEL_DIR)/drivers/net/wireless/bcmdhd/bcmdhd.ko
DST := $(LOCAL_PATH)/../common/bcm4330/wifi/bcmdhd.ko
$(shell test $(DST) -ot $(SRC) && cp $(SRC) $(DST))
endif

# Camera
ifeq ($(BOARD_USE_LEGACY_CAMERA),false)
PRODUCT_PACKAGES += \
	Camera
else
PRODUCT_PACKAGES += \
	LegacyCamera
endif

# Live Wallpapers
PRODUCT_PACKAGES += \
	Galaxy4 \
	HoloSpiralWallpaper \
	NoiseField \
	PhaseBeam \
	LiveWallpapers \
	LiveWallpapersPicker \
	MagicSmokeWallpapers \
	VisualizationWallpapers \
	librs_jni

# RIL related packages
PRODUCT_PACKAGES += \
	chat

# RIL related files
PRODUCT_COPY_FILES += \
	device/magiclab/magiclego4x12/ril/etc/apns-conf.xml:system/etc/apns-conf.xml \
	device/magiclab/magiclego4x12/ril/etc/spn-conf.xml:system/etc/spn-conf.xml \
	device/magiclab/magiclego4x12/ril/etc/ppp/chat-isp:system/etc/ppp/chat-isp \
	device/magiclab/magiclego4x12/ril/etc/ppp/chap-secrets:system/etc/ppp/chap-secrets \
	device/magiclab/magiclego4x12/ril/etc/ppp/ip-down:system/etc/ppp/ip-down \
	device/magiclab/magiclego4x12/ril/etc/ppp/ip-up:system/etc/ppp/ip-up \
	device/magiclab/magiclego4x12/ril/etc/ppp/modem-init:system/etc/ppp/modem-init \
	device/magiclab/magiclego4x12/ril/etc/ppp/peers/options.ppp:system/etc/ppp/peers/options.ppp

# Add apks for demo purpose
include $(LOCAL_PATH)/../common/inhouse_app/inhouse_app_product_packages.mk

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/magiclab/magiclego4x12/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_magiclego4x12
PRODUCT_DEVICE := magiclego4x12
PRODUCT_MANUFACTURER := Coasia
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full Android on MagicLEGO4x12
