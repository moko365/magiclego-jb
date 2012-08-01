ifeq ($(BOARD_USE_BINARY_BUILD),true)

LOCAL_PATH := $(call my-dir)

# ====================

include $(CLEAR_VARS)

LOCAL_MODULE := com.yamaha.android.media.jar

LOCAL_SRC_FILES := $(LOCAL_MODULE)

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_CLASS := JAVA_LIBRARIES

LOCAL_MODULE_PATH := $(TARGET_OUT_JAVA_LIBRARIES)

include $(BUILD_PREBUILT)

#====================

include $(CLEAR_VARS)

LOCAL_MODULE := com.yamaha.android.media.xml

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_CLASS := ETC

# This will install the file in /system/etc/permissions

LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)

#====================

include $(CLEAR_VARS)

LOCAL_MODULE := CodecTuner

LOCAL_SRC_FILES := $(LOCAL_MODULE).apk

LOCAL_MODULE_CLASS := APPS

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

LOCAL_CERTIFICATE := PRESIGNED

include $(BUILD_PREBUILT)

endif
