#include $(call all-named-subdir-makefiles, alsa_sound liblights libsensors)
LOCAL_PATH := $(call my-dir)
include $(call all-makefiles-under,$(LOCAL_PATH))
