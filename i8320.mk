PRODUCT_PACKAGES += \
    sensors.i8320 \
    alsa.i8320\
    lights.i8320 \
    overlay.i8320 

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Include TI FM
#$(call inherit-product, vendor/cyanogen/products/ti_fm_radio.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)
#$(call inherit-product, vendor/cyanogen/products/common-vic.mk)

# Pick up audio package
include frameworks/base/data/sounds/AudioPackage2.mk

# Overrides
DEVICE_PACKAGE_OVERLAYS := device/samsung/i8320/overlay

# OMX components
# Addition of LOCAL_MODULE_TAGS requires us to specify
# libraries needed for a particular device
PRODUCT_PACKAGES += \
	01_Vendor_ti_omx.cfg \
	libVendor_ti_omx \
	libVendor_ti_omx_config_parser \
	libOMX_Core \
	libLCML \
	libOMX.TI.Video.Decoder \
	libOMX.TI.Video.encoder \
	libOMX.TI.WBAMR.decode \
	libOMX.TI.AAC.encode \
	libOMX.TI.G722.decode \
	libOMX.TI.MP3.decode \
	libOMX.TI.WMA.decode \
	libOMX.TI.Video.encoder \
	libOMX.TI.WBAMR.encode \
	libOMX.TI.G729.encode \
	libOMX.TI.AAC.decode \
	libOMX.TI.VPP \
	libOMX.TI.G711.encode \
	libOMX.TI.JPEG.encoder \
	libOMX.TI.G711.decode \
	libOMX.TI.ILBC.decode \
	libOMX.TI.ILBC.encode \
	libOMX.TI.AMR.encode \
	libOMX.TI.G722.encode \
	libOMX.TI.JPEG.decoder \
	libOMX.TI.G726.encode \
	libOMX.TI.G729.decode \
	libOMX.TI.Video.Decoder \
	libOMX.TI.AMR.decode \
	libOMX.TI.G726.decode \
        tiomxplayer 
        
dPRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html
    
# root/
PRODUCT_COPY_FILES := \
	device/samsung/i8320/init.rc:root/init.rc \
	device/samsung/i8320/init.samsung.rc:root/init.samsung.rc\
	device/samsung/i8320/ueventd.samsung.rc:root/ueventd.samsung.rc\
	device/samsung/i8320/lib/firmware/TIInit_7.2.31.bts:root/lib/firmware/TIInit_7.2.31.bts

# system/etc/
PRODUCT_COPY_FILES += \
	device/samsung/i8320/system/etc/asound.conf:system/etc/asound.conf \
	device/samsung/i8320/system/etc/vold.fstab:system/etc/vold.fstab \
	device/samsung/i8320/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/i8320/system/etc/init.samsung.sh:system/etc/init.samsung.sh

# system/etc/permissions/ Install the features available on this device.
PRODUCT_COPY_FILES += \
    device/samsung/i8320/system/etc/permissions/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml
    
# system/etc/wifi
PRODUCT_COPY_FILES += \
	device/samsung/i8320/system/etc/wifi/firmware.bin:system/etc/wifi/firmware.bin \
	device/samsung/i8320/system/etc/wifi/nvs_map.bin:system/etc/wifi/nvs_map.bin \
	device/samsung/i8320/system/etc/wifi/tiwlan_drv.ko:system/etc/wifi/tiwlan_drv.ko \
	device/samsung/i8320/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/samsung/i8320/system/etc/wifi/tiwlan.ini:system/etc/wifi/tiwlan.ini

# system/bin/
PRODUCT_COPY_FILES += \
	device/samsung/i8320/system/bin/rc.pvr:system/bin/rc.pvr \
	device/samsung/i8320/system/bin/wlaninit:system/bin/wlaninit \
	device/samsung/i8320/system/bin/pvrsrvinit:system/bin/pvrsrvinit


# system/lib/
PRODUCT_COPY_FILES += \
	device/samsung/i8320/system/lib/libfakehal.so:system/lib/libfakehal.so \
	device/samsung/i8320/system/lib/libIMGegl.so:system/lib/libIMGegl.so \
	device/samsung/i8320/system/lib/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \
	device/samsung/i8320/system/lib/libsfutil.so:system/lib/libsfutil.so \
	device/samsung/i8320/system/lib/libglslcompiler.so:system/lib/libglslcompiler.so \
	device/samsung/i8320/system/lib/libpvr2d.so:system/lib/libpvr2d.so \
	device/samsung/i8320/system/lib/libPVRScopeServices.so:system/lib/libPVRScopeServices.so \
	device/samsung/i8320/system/lib/libsrv_um.so:system/lib/libsrv_um.so\
	device/samsung/i8320/system/lib/libsec-ril.so:system/lib/libsec-ril.so

# system/lib/hw/
PRODUCT_COPY_FILES += \
	device/samsung/i8320/system/lib/hw/gralloc.omap3.so:system/lib/hw/gralloc.omap3.so

# system/lib/egl/
PRODUCT_COPY_FILES += \
	device/samsung/i8320/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
	device/samsung/i8320/system/lib/egl/libEGL_POWERVR_SGX530_121.so:system/lib/egl/libEGL_POWERVR_SGX530_121.so \
	device/samsung/i8320/system/lib/egl/libGLESv2_POWERVR_SGX530_121.so:system/lib/egl/libGLESv2_POWERVR_SGX530_121.so \
	device/samsung/i8320/system/lib/egl/libGLESv1_CM_POWERVR_SGX530_121.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX530_121.so

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := i8320
PRODUCT_DEVICE := i8320
PRODUCT_MODEL := SAMSUNG-GT-I8320
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

PRODUCT_LOCALES := hdpi en_US zh_CN
PRODUCT_DEFAULT_LANGUAGE := zh_CN

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/device/samsung/i8320/prelink-linux-arm-i8320.map

