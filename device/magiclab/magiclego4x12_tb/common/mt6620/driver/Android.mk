# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq ($(BOARD_HAVE_MTK_MT6620),true)
LOCAL_PATH := $(call my-dir)

KERNEL_DIR ?= $(TOPDIR)../kernel
DRIVER_DIR ?= $(KERNEL_DIR)/drivers/mtk_wcn_combo/

# copy all driver *.ko files here
SRCS := $(shell find $(DRIVER_DIR) -name "*.ko")
#$(info copy MT6620 drivers into proprietary folder and build prebuilt: $(SRCS))

$(foreach i, $(SRCS), \
  $(eval SRC := $(i)) \
  $(eval DST := $(LOCAL_PATH)/$(notdir $(i))) \
  $(shell test $(DST) -ot $(SRC) && cp $(SRC) $(DST) ) \
)

# build prebuilt to put files into /system/lib/modules/
$(foreach i, $(SRCS), \
  $(eval include $(CLEAR_VARS)) \
  $(eval LOCAL_MODULE := $(notdir $(i))) \
  $(eval LOCAL_MODULE_TAGS := optional) \
  $(eval LOCAL_MODULE_CLASS := EXECUTABLES) \
  $(eval LOCAL_MODULE_PATH := $(TARGET_OUT)/lib/modules) \
  $(eval LOCAL_SRC_FILES := $(LOCAL_MODULE)) \
  $(eval include $(BUILD_PREBUILT)) \
 )
endif
