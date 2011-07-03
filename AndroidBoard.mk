LOCAL_PATH := $(call my-dir)

# keyboard layouts
#



file := $(TARGET_OUT_KEYLAYOUT)/gpio-keys.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/gpio-keys.kl | $(ACP)
	$(transform-prebuilt-to-target)
	
file := $(TARGET_OUT_KEYLAYOUT)/TWL4030_Keypad.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/TWL4030_Keypad.kl | $(ACP)
	$(transform-prebuilt-to-target)	


include $(CLEAR_VARS)
LOCAL_SRC_FILES := gpio-keys.kcm
LOCAL_MODULE_TAGS := optional
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := TWL4030_Keypad.kcm
LOCAL_MODULE_TAGS := optional
include $(BUILD_KEY_CHAR_MAP)
