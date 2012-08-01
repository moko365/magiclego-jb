#!/bin/bash

# This is a sample of the command line make used to build
#   the libraries and binaries.
# Please customize this path to match the location of your
#   Android source tree. Other variables may also need
#   to be customized such as:
#   $CROSS, $PRODUCT, $KERNEL_ROOT


LOCAL_PATH=$(pwd)
TARGET_DEVICE=$1
ANDROID_BASE=${LOCAL_PATH}
CROSS_PATH=${LOCAL_PATH}/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin
MLSDK_ROOT_PATH=${LOCAL_PATH}/device/magiclab/common/libsensors/mlsdk

cd ${MLSDK_ROOT_PATH}

make MPU_NAME=MPU6050B1 VERBOSE=1 TARGET=android ANDROID_ROOT=${ANDROID_BASE} KERNEL_ROOT=${ANDROID_BASE}/../kernel CROSS=${CROSS_PATH}/arm-eabi- PRODUCT=${TARGET_DEVICE} MPL_LIB_NAME=mplmpu echo_in_colors=echo -f Android-shared.mk
make MPU_NAME=MPU6050B1 VERBOSE=1 TARGET=android ANDROID_ROOT=${ANDROID_BASE} KERNEL_ROOT=${ANDROID_BASE}/../kernel CROSS=${CROSS_PATH}/arm-eabi- PRODUCT=${TARGET_DEVICE} MPL_LIB_NAME=mplmpu echo_in_colors=echo -f Android-static.mk

# remove proprietary binary
rm -rf ${MLSDK_ROOT_PATH}/mllite/mpl/android/obj/
rm -rf ${MLSDK_ROOT_PATH}/platform/linux/obj/
