ifeq ($(BOARD_USE_BINARY_BUILD),true)
else
endif

# Set the path of lisa
LISA_PATH := $(LOCAL_PATH)/../common/lisa

# U-blox RIL communication interface
RIL_COM_INTERFACE := uart

# RIL related packages
PRODUCT_PACKAGES += \
	chat \
	gsm0710muxd \
	libublox-lisa-ril \
	librapid-ril-core

# RIL related files
PRODUCT_COPY_FILES += \
	$(LISA_PATH)/conf/init.lisa.rc:root/init.ril.rc \
	$(LISA_PATH)/system/bin/rilc.sh:system/bin/rilc.sh \
	$(LISA_PATH)/system/bin/init.gprs-pppd:system/bin/init.gprs-pppd \
	$(LISA_PATH)/system/bin/stop_pppd:system/bin/stop_pppd \
	$(LISA_PATH)/system/bin/rril-repo.sh:system/bin/rril-repo.sh \
	$(LISA_PATH)/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
	$(LISA_PATH)/system/etc/spn-conf.xml:system/etc/spn-conf.xml \
	$(LISA_PATH)/system/etc/ppp/chap-secrets:system/etc/ppp/chap-secrets \
	$(LISA_PATH)/system/etc/ppp/pap-secrets:system/etc/ppp/pap-secrets \
	$(LISA_PATH)/system/etc/ppp/ip-down:system/etc/ppp/ip-down \
	$(LISA_PATH)/system/etc/ppp/ip-up:system/etc/ppp/ip-up \
	$(LISA_PATH)/system/etc/rril/repository.txt:system/etc/rril/repository.txt

# Default settting
PRODUCT_COPY_FILES += \
	$(LISA_PATH)/system/etc/ppp/chat-isp:/system/etc/ppp/chat-isp \
	$(LISA_PATH)/system/etc/ppp/peers/options.ppp:system/etc/ppp/peers/options.ppp

# Interface settting
ifeq ($(strip $(RIL_COM_INTERFACE)),spi)
PRODUCT_COPY_FILES += \
	$(LISA_PATH)/system/bin/stop_muxd:system/bin/stop_muxd \
	$(LISA_PATH)/system/etc/ppp/chat-isp1:/system/etc/ppp/chat-isp1 \
	$(LISA_PATH)/system/etc/ppp/chat-isp2:/system/etc/ppp/chat-isp2 \
	$(LISA_PATH)/system/etc/ppp/peers/spi-gprs1:system/etc/ppp/peers/gprs1 \
	$(LISA_PATH)/system/etc/ppp/peers/spi-gprs2:system/etc/ppp/peers/gprs2
else ifeq ($(strip $(RIL_COM_INTERFACE)),uart)
PRODUCT_COPY_FILES += \
	$(LISA_PATH)/system/bin/stop_muxd:system/bin/stop_muxd \
	$(LISA_PATH)/system/etc/ppp/chat-isp1:/system/etc/ppp/chat-isp1 \
	$(LISA_PATH)/system/etc/ppp/chat-isp2:/system/etc/ppp/chat-isp2 \
	$(LISA_PATH)/system/etc/ppp/peers/uart-gprs1:system/etc/ppp/peers/gprs1 \
	$(LISA_PATH)/system/etc/ppp/peers/uart-gprs2:system/etc/ppp/peers/gprs2
else ifeq ($(strip $(RIL_COM_INTERFACE)),usb)
PRODUCT_COPY_FILES += \
	$(LISA_PATH)/system/etc/ppp/chat-isp1:/system/etc/ppp/chat-isp1 \
	$(LISA_PATH)/system/etc/ppp/chat-isp2:/system/etc/ppp/chat-isp2 \
	$(LISA_PATH)/system/etc/ppp/peers/usb-gprs1:system/etc/ppp/peers/gprs1 \
	$(LISA_PATH)/system/etc/ppp/peers/usb-gprs2:system/etc/ppp/peers/gprs2
endif
