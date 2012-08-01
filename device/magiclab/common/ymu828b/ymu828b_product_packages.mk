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

# init.audio.rc
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/../common/ymu828b/init.ymu828b.rc:root/init.audio.rc

# Yamaha SoundEffec
ifeq ($(BOARD_USE_BINARY_BUILD),true)
ALSA_CONF_SRC := $(LOCAL_PATH)/../common/ymu828b/binary/alsa
else
ALSA_CONF_SRC := external/alsa-lib/src/conf
endif
ALSA_CONF_DST := system/usr/share/alsa
PRODUCT_COPY_FILES += \
	$(ALSA_CONF_SRC)/alsa.conf:$(ALSA_CONF_DST)/alsa.conf \
	$(ALSA_CONF_SRC)/pcm/dsnoop.conf:$(ALSA_CONF_DST)/pcm/dsnoop.conf \
	$(ALSA_CONF_SRC)/pcm/modem.conf:$(ALSA_CONF_DST)/pcm/modem.conf \
	$(ALSA_CONF_SRC)/pcm/dpl.conf:$(ALSA_CONF_DST)/pcm/dpl.conf \
	$(ALSA_CONF_SRC)/pcm/default.conf:$(ALSA_CONF_DST)/pcm/default.conf \
	$(ALSA_CONF_SRC)/pcm/surround51.conf:$(ALSA_CONF_DST)/pcm/surround51.conf \
	$(ALSA_CONF_SRC)/pcm/surround41.conf:$(ALSA_CONF_DST)/pcm/surround41.conf \
	$(ALSA_CONF_SRC)/pcm/surround50.conf:$(ALSA_CONF_DST)/pcm/surround50.conf \
	$(ALSA_CONF_SRC)/pcm/dmix.conf:$(ALSA_CONF_DST)/pcm/dmix.conf \
	$(ALSA_CONF_SRC)/pcm/center_lfe.conf:$(ALSA_CONF_DST)/pcm/center_lfe.conf \
	$(ALSA_CONF_SRC)/pcm/surround40.conf:$(ALSA_CONF_DST)/pcm/surround40.conf \
	$(ALSA_CONF_SRC)/pcm/side.conf:$(ALSA_CONF_DST)/pcm/side.conf \
	$(ALSA_CONF_SRC)/pcm/iec958.conf:$(ALSA_CONF_DST)/pcm/iec958.conf \
	$(ALSA_CONF_SRC)/pcm/rear.conf:$(ALSA_CONF_DST)/pcm/rear.conf \
	$(ALSA_CONF_SRC)/pcm/surround71.conf:$(ALSA_CONF_DST)/pcm/surround71.conf \
	$(ALSA_CONF_SRC)/pcm/front.conf:$(ALSA_CONF_DST)/pcm/front.conf \
	$(ALSA_CONF_SRC)/cards/aliases.conf:$(ALSA_CONF_DST)/cards/aliases.conf

# for YAAS
ifeq  ($(BOARD_USE_BINARY_BUILD),true)
YMC_SRC := $(LOCAL_PATH)/../common/ymu828b/binary/
else
YMC_SRC := $(LOCAL_PATH)/../common/ymu828b/apache2.0/src/libaudio_sample
endif

YMC_PRM_SRC := $(YMC_SRC)/param
YMC_PRM_DST := root/ymc/param
PRODUCT_COPY_FILES += \
	$(YMC_SRC)/asound.conf:system/etc/asound.conf \
	$(YMC_PRM_SRC)/agc_off.dat:$(YMC_PRM_DST)/agc_off.dat \
	$(YMC_PRM_SRC)/dng_off.dat:$(YMC_PRM_DST)/dng_off.dat \
	$(YMC_PRM_SRC)/dsp_off.dat:$(YMC_PRM_DST)/dsp_off.dat \
	$(YMC_PRM_SRC)/dsp_through.dat:$(YMC_PRM_DST)/dsp_through.dat \
	$(YMC_PRM_SRC)/handsfree_1.dat:$(YMC_PRM_DST)/handsfree_1.dat \
	$(YMC_PRM_SRC)/handsfree_2.dat:$(YMC_PRM_DST)/handsfree_2.dat \
	$(YMC_PRM_SRC)/handsfree_off.dat:$(YMC_PRM_DST)/handsfree_off.dat \
	$(YMC_PRM_SRC)/post_process/output/HP_Dance.dat:$(YMC_PRM_DST)/post_process/output/HP_Dance.dat \
	$(YMC_PRM_SRC)/post_process/output/HP_JazzBar.dat:$(YMC_PRM_DST)/post_process/output/HP_JazzBar.dat \
	$(YMC_PRM_SRC)/post_process/output/HP_Pop.dat:$(YMC_PRM_DST)/post_process/output/HP_Pop.dat \
	$(YMC_PRM_SRC)/post_process/output/SP_Dance.dat:$(YMC_PRM_DST)/post_process/output/SP_Dance.dat \
	$(YMC_PRM_SRC)/post_process/output/SP_JazzBar.dat:$(YMC_PRM_DST)/post_process/output/SP_JazzBar.dat \
	$(YMC_PRM_SRC)/post_process/output/SP_Pop.dat:$(YMC_PRM_DST)/post_process/output/SP_Pop.dat \
	$(YMC_PRM_SRC)/post_process/output/dsp_through.dat:$(YMC_PRM_DST)/post_process/output/dsp_through.dat \
	$(YMC_PRM_SRC)/post_process/output/output.xml:$(YMC_PRM_DST)/post_process/output/output.xml \
	$(YMC_PRM_SRC)/voice_process/1mic_off.dat:$(YMC_PRM_DST)/voice_process/1mic_off.dat \
	$(YMC_PRM_SRC)/voice_process/1mic_sample.dat:$(YMC_PRM_DST)/voice_process/1mic_sample.dat \
	$(YMC_PRM_SRC)/voice_process/2mic_off.dat:$(YMC_PRM_DST)/voice_process/2mic_off.dat \
	$(YMC_PRM_SRC)/voice_process/2mic_sample.dat:$(YMC_PRM_DST)/voice_process/2mic_sample.dat \
	$(YMC_PRM_SRC)/voice_process/voice_process.xml:$(YMC_PRM_DST)/voice_process/voice_process.xml

PRODUCT_PACKAGES += \
	com.yamaha.android.media.jar \
	com.yamaha.android.media.xml \
	liba2dp \
	CodecTuner

PRODUCT_PROPERTY_OVERRIDES += \
	magiclab.hardware.ymu828b.enable=1

# Depoly binary resource, LOCAL_PATH is device folder
ifeq ($(BOARD_USE_BINARY_BUILD),true)
	BINARY_SRC := $(LOCAL_PATH)/../common/ymu828b/binary

	# Deploy files to obj/lib
	BINARY_DST := obj/lib/
	PRODUCT_COPY_FILES += \
		$(BINARY_SRC)/audio.primary.$(DEVICE_NAME).so:$(BINARY_DST)/audio.primary.$(DEVICE_NAME).so \
		$(BINARY_SRC)/audio_policy.$(DEVICE_NAME).so:$(BINARY_DSTll)/audio_policy.$(DEVICE_NAME).so

	# Deploy files to system/lib/hw
	BINARY_DST := system/lib/hw
	PRODUCT_COPY_FILES += \
		$(BINARY_SRC)/audio.primary.$(DEVICE_NAME).so:$(BINARY_DST)/audio.primary.$(DEVICE_NAME).so \
		$(BINARY_SRC)/audio_policy.$(DEVICE_NAME).so:$(BINARY_DST)/audio_policy.$(DEVICE_NAME).so

	# Deploy files to system/lib/
	BINARY_DST := system/lib/
	PRODUCT_COPY_FILES += \
		$(BINARY_SRC)/libasound.so:$(BINARY_DST)/libasound.so \
		$(BINARY_SRC)/libymc_codecctrl.so:$(BINARY_DST)/libymc_codecctrl.so \
		$(BINARY_SRC)/libcodectuner_jni.so:$(BINARY_DST)/libcodectuner_jni.so \
		$(BINARY_SRC)/libymc_config.so:$(BINARY_DST)/libymc_config.so \
		$(BINARY_SRC)/libmediayamaha_jni.so:$(BINARY_DST)/libmediayamaha_jni.so \
		$(BINARY_SRC)/libymc_dtmf.so:$(BINARY_DST)/libymc_dtmf.so \
		$(BINARY_SRC)/libymc_analogin.so:$(BINARY_DST)/libymc_analogin.so

	# Some type of resource should using PREBUILT flag (exe, apk, jar)
endif
