#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
#PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xlarge sw600dp sw720dp
#PRODUCT_AAPT_PREF_CONFIG := xlarge
#PRODUCT_AAPT_PREF_CONFIG := 

PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/init.p3.rc:root/init.p3.rc \
    $(LOCAL_PATH)/ueventd.p3.rc:root/ueventd.p3.rc \
    $(LOCAL_PATH)/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/init.p3.usb.rc:root/init.p3.usb.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    $(LOCAL_PATH)/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/keylayout/sec_power_key.kl:system/usr/keylayout/sec_power_key.kl \
    $(LOCAL_PATH)/keylayout/sec_keyboard.kl:system/usr/keylayout/sec_keyboard.kl \
    $(LOCAL_PATH)/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    $(LOCAL_PATH)/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/gps.xml:system/etc/gps.xml \
     $(LOCAL_PATH)/gps.conf:system/etc/gps.conf

# LPM (from TW-UX 3.2)
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/lpm/lib/libQmageDecoder.so:system/lib/libQmageDecoder.so \
     $(LOCAL_PATH)/lpm/bin/charging_mode:system/bin/charging_mode \
     $(LOCAL_PATH)/lpm/bin/playlpm:system/bin/playlpm \
     $(LOCAL_PATH)/lpm/media/battery_charging_0.qmg:system/media/battery_charging_0.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_20.qmg:system/media/battery_charging_20.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_40.qmg:system/media/battery_charging_40.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_60.qmg:system/media/battery_charging_60.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_80.qmg:system/media/battery_charging_80.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_100.qmg:system/media/battery_charging_100.qmg \
     $(LOCAL_PATH)/lpm/media/battery_error.qmg:system/media/battery_error.qmg \
     $(LOCAL_PATH)/lpm/media/chargingwarning.qmg:system/media/chargingwarning.qmg \
     $(LOCAL_PATH)/lpm/media/Disconnected.qmg:system/media/Disconnected.qmg

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/bcm4330_aps.bin:system/etc/wifi/bcm4330_apsta.bin

BOARD_WLAN_DEVICE_REV := bcm4330_b1

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

PRODUCT_PACKAGES += \
        libinvensense_mpl

PRODUCT_PACKAGES += \
        audio.a2dp.default \
        libaudioutils \
        audio.primary.p3
        
# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

DEVICE_PACKAGE_OVERLAYS := \
    $(LOCAL_PATH)/overlay

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
	PRODUCT_PACKAGES += send_bug
	PRODUCT_COPY_FILES += \
        system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
        system/extras/bugmailer/send_bug:system/bin/send_bug
endif

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)

