# hardware/libaudio-alsa/Android.mk
#
# Copyright 2008 Wind River Systems
#

ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)

  LOCAL_PATH := $(call my-dir)

  include $(CLEAR_VARS)
  LOCAL_MODULE_TAGS := user
  LOCAL_PRELINK_MODULE := false

  LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

  LOCAL_CFLAGS := -D_POSIX_SOURCE -Wno-multichar

ifneq ($(ALSA_DEFAULT_SAMPLE_RATE),)
    LOCAL_CFLAGS += -DALSA_DEFAULT_SAMPLE_RATE=$(ALSA_DEFAULT_SAMPLE_RATE)
endif

  LOCAL_C_INCLUDES += hardware/alsa_sound external/alsa-lib/include
  
  LOCAL_SRC_FILES:= alsa_i8320.cpp
  LOCAL_SRC_FILES+= ALSAMixer.cpp

  LOCAL_SHARED_LIBRARIES := \
    libaudio \
    libasound \
    liblog \
    libcutils \
    libutils \
    libdl
  LOCAL_MODULE_TAGS := eng
  LOCAL_MODULE:= alsa.$(TARGET_BOOTLOADER_BOARD_NAME)

  include $(BUILD_SHARED_LIBRARY)

endif
