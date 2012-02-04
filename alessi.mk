$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/alessi/alessi-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/alessi/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/alessi/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.alessi.rc:root/init.alessi.rc \
    $(LOCAL_PATH)/ueventd.alessi.rc:root/ueventd.alessi.rc

# BT startup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/alessi_keypad.kl:system/usr/keylayout/alessi_keypad.kl \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/lgosp-hid.kl:system/usr/keylayout/lgosp-hid.kl \
    $(LOCAL_PATH)/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvram.txt:system/etc/wl/nvram.txt \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko \
    $(LOCAL_PATH)/prebuilt/tun.ko:system/lib/modules/tun.ko \
    $(LOCAL_PATH)/prebuilt/cifs.ko:system/lib/modules/cifs.ko \
    $(LOCAL_PATH)/prebuilt/lgosp-hid.ko:system/lib/modules/lgosp-hid.ko	\
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

# chargermode
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_bg_bk.rle:root/chargerimages/battery_bg_bk.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    $(LOCAL_PATH)/chargemode/chargerlogo:root/sbin/chargerlogo

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml 

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PACKAGES += \
    hwaddrs \
    libOmxCore

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := alessi
PRODUCT_DEVICE := alessi
PRODUCT_MODEL := LG Optimus Chic
