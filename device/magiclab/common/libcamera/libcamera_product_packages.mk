# Copyright (C) 2008 The Android Open Source Project
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

# Depoly binary resource, LOCAL_PATH is device folder
ifeq ($(BOARD_USE_BINARY_BUILD),true)
	BINARY_SRC := $(LOCAL_PATH)/../common/libcamera/binary

	# Deploy files to obj/lib
	BINARY_DST := obj/lib/
	PRODUCT_COPY_FILES += \
		$(BINARY_SRC)/camera.$(DEVICE_NAME).so:$(BINARY_DST)/camera.$(DEVICE_NAME).so

	# Deploy files to system/lib/hw
	BINARY_DST := system/lib/hw
	PRODUCT_COPY_FILES += \
		$(BINARY_SRC)/camera.$(DEVICE_NAME).so:$(BINARY_DST)/camera.$(DEVICE_NAME).so

	# Deploy files to system/lib/

	# Some type of resource should using PREBUILT flag (exe, apk, jar)
endif
