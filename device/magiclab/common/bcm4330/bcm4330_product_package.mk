# init.rc
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/../common/bcm4330/init.wireless.rc:root/init.wireless.rc

# property
PRODUCT_PROPERTY_OVERRIDES += \
	magiclab.hw.bcm4330.enable=1 \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# wifi
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	$(LOCAL_PATH)/../common/bcm4330/wifi/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
	$(LOCAL_PATH)/../common/bcm4330/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
	$(LOCAL_PATH)/../common/bcm4330/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# bluetooth
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/../common/bcm4330/bt/hciattach:system/xbin/hciattach \
	$(LOCAL_PATH)/../common/bcm4330/bt/bcm4330b1.hcd:system/vendor/firmware/bcm4330b1.hcd \
	$(LOCAL_PATH)/../common/bcm4330/bt/main.le.conf:system/etc/bluetooth/main.conf

BOARD_WLAN_DEVICE_REV := bcm4330_b2
WIFI_BAND             := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
