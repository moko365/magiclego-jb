#
# Copyright(c) 2011 Yamaha Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License. 
# You may obtain a copy of the License at 
#
#     http://www.apache.org/licenses/LICENSE-2.0 
#
# Unless required by applicable law or agreed to in writing, software 
# distributed under the License is distributed on an "AS IS" BASIS, 
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
# See the License for the specific language governing permissions and 
# limitations under the License.
#

ifeq ($(strip $(BOARD_USE_YAMAHA_AUDIO_HAL)),true)

LOCAL_PATH:= $(call my-dir)

# Include path (apache2.0)
YMC_APACHE_PATH := $(LOCAL_PATH)/apache2.0
# $(info YMC_APACHE_PATH $(YMC_APACHE_PATH))

# Include path (confidential)
YMC_CONFIDENTIAL_PATH := $(LOCAL_PATH)/confidential
YMC_CONFIDENTIAL_INCLUDE := $(YMC_CONFIDENTIAL_PATH)/include
# $(info YMC_CONFIDENTIAL_PATH $(YMC_CONFIDENTIAL_PATH))

# $(info PLATFORM_SDK_VERSION $(PLATFORM_SDK_VERSION))

include $(call all-subdir-makefiles)

endif
