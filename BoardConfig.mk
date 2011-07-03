# The generic product target doesn't have any hardware-specific pieces.
TARGET_BOARD_PLATFORM := omap3

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RECOVERY      := true
TARGET_NO_RADIOIMAGE := true

TARGET_PRODUCT:=samsung
TARGET_BOARD := GT-I8320
TARGET_USES_OLD_LIBSENSORS_HAL := true
TARGET_SENSORS_NO_OPEN_CHECK := true

TARGET_PROVIDES_INIT_RC := true

TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
ANDROID_ARM_LINKER := true
ARCH_ARM_HAVE_TLS_REGISTER := true

#ALSA_Sound
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
ALSA_DEFAULT_SAMPLE_RATE := 44100

#Camera
BOARD_USES_TI_CAMERA_HAL := true
USE_CAMERA_STUB := false
BOARD_USE_FROYO_LIBCAMERA := true
BOARD_USE_YUV422I_DEFAULT_COLORFORMAT := true
HARDWARE_OMX := true

ifdef HARDWARE_OMX
JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
   hardware/ti/omx/system/src/openmax_il/omx_core/inc \
   hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
#BOARD_CAMERA_LIBRARIES := libcamera
endif

#BOARD_KERNEL_CMDLINE := console=null no_console_suspend g_android.product_id=0x1354 g_android.serial_number=Victor-I8320

TARGET_BOOTLOADER_BOARD_NAME := i8320


# Wifi
USES_TI_WL1271 := true
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
ifdef USES_TI_WL1271
BOARD_WLAN_DEVICE           := wl1271
BOARD_SOFTAP_DEVICE         := wl1271
endif
WPA_SUPPLICANT_VERSION      := VER_0_6_X
WIFI_DRIVER_MODULE_PATH     := "/system/etc/wifi/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_FIRMWARE_LOADER        := "wlan_loader"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# FM
#BUILD_FM_RADIO := true
#BOARD_HAVE_FM_ROUTING := true
#FM_CHR_DEV_ST := true

WITH_JIT := true
ENABLE_JSC_JIT := true

#vold
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/musb_hdrc/gadget/lun
BOARD_UMS_LUNFILE := "/sys/devices/platform/musb_hdrc/gadget/lun0/file"
