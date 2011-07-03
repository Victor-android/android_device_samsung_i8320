# Setting LOCAL_PATH will mess up all-subdir-makefiles, so do it beforehand.
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),i8320)

SAVE_MAKEFILES := $(call all-subdir-makefiles)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := libutils libcutils

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

include $(SAVE_MAKEFILES)

endif