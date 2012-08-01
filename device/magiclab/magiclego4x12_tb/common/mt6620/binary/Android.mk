LOCAL_PATH := $(call my-dir)

SRCS := $(shell find $(LOCAL_PATH)/../external/combo_tool -name "*.c")

BUILD_LAUNCHER  := false
BUILD_WMT_LPBK  := false
BUILD_FM_SUPPORT := false
BUILD_MT6620_LIB := false
BUILD_HALD  := false
BUILD_HALC  := false
BUILD_HW_TEST  := false
BUILD_WPA_SUPPLICANT := false
BUILD_P2P_SUPPLICANT := false
BUILD_GPS_HAL := false
BUILD_LIBMNLP := false
BUILD_MNLD := false

ifeq ($(SRCS),)
# applied to MT6620
ifeq ($(BOARD_HAVE_MTK_MT6620),true)
BUILD_LAUNCHER  := true
BUILD_WMT_LPBK  := true
BUILD_FM_SUPPORT := true
BUILD_MT6620_LIB := true
BUILD_HALD  := true
BUILD_HALC  := true
BUILD_HW_TEST  := true
BUILD_WPA_SUPPLICANT := true
BUILD_P2P_SUPPLICANT := true
BUILD_GPS_HAL := true
BUILD_LIBMNLP := true
BUILD_MNLD := true
endif
endif

ifeq ($(BUILD_LAUNCHER), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := 6620_launcher
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := 6620_launcher
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_WMT_LPBK), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := 6620_wmt_lpbk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
LOCAL_SRC_FILES := 6620_wmt_lpbk
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_FM_SUPPORT), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := libfmcust
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := libfmjni
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################


########################
include $(CLEAR_VARS)
LOCAL_MODULE := FMRadio
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_MT6616_LIB), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := libfmmt6616
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_MT6620_LIB), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := libfmmt6620
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_AR1000_LIB), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := libfmar1000
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_FMTEST), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := fmtest
LOCAL_SRC_FILES := $(LOCAL_MODULE)
OCAL_PRELINK_MODULE := yes
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_HALD), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := hald
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_HALC), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := hdc
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_HW_TEST), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := libwifitest
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := eng
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := libbluetooth_mtk
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := eng
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := libbluetoothem_ex
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := libautogps
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := libfmr
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := wcntest
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := wcntestd
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := autobt
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := wcnem
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := wifitest
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := eng
LOCAL_SHARED_LIBRARIES := libwifitest
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := fmtest
LOCAL_SRC_FILES := $(LOCAL_MODULE)
OCAL_PRELINK_MODULE := yes
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_WPA_SUPPLICANT),true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := wpa_cli
LOCAL_MODULE_TAGS := debug
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := wpa_passphrase
LOCAL_MODULE_TAGS := debug
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := wpa_supplicant
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := wpa_supplicant.conf
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc/wifi
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE = libwpa_client
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
WPA_CLIENT_HEADER_PATH := $(TARGET_OUT_HEADERS)/libwpa_client
$(shell test ! -d $(TARGET_OUT_HEADERS) && mkdir $(TARGET_OUT_HEADERS) )
$(shell test ! -d $(WPA_CLIENT_HEADER_PATH) && mkdir $(WPA_CLIENT_HEADER_PATH) )
$(shell test ! -f $(WPA_CLIENT_HEADER_PATH)/wpa_ctrl.h && cp $(LOCAL_PATH)/wpa_ctrl.h $(WPA_CLIENT_HEADER_PATH))
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_P2P_SUPPLICANT),true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := p2p_cli
LOCAL_MODULE_TAGS := debug
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := p2p_supplicant
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE := p2p_supplicant.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc/wifi
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
########################

########################
include $(CLEAR_VARS)
LOCAL_MODULE = libp2p_client
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_GPS_HAL),true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := gps.default
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_LIBMNLP), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := libmnlp
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################
endif

ifeq ($(BUILD_MNLD), true)
########################
include $(CLEAR_VARS)
LOCAL_MODULE := mnld
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
########################
endif
