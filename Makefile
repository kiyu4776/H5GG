THEOS_PACKAGE_SCHEME = rootless
TARGET = iphone:clang:latest:15.0
ARCHS = arm64
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)


THEOS_PLATFORM_DEB_COMPRESSION_TYPE = gzip

DEBUG=0
STRIP=1
FINALPACKAGE=1

include $(THEOS)/makefiles/common.mk


TWEAK_NAME = H5GG

export ADDITIONAL_CFLAGS = -fmodules-cache-path=/tmp/theos_module_cache -fmodules
export ADDITIONAL_CCFLAGS =

$(TWEAK_NAME)_FILES = Tweak.mm ldid-master/ldid.cpp ldid-master/lookup2.c

$(TWEAK_NAME)_CFLAGS = -fobjc-arc -fvisibility=hidden \
  -Wno-error=deprecated-non-prototype -Wno-error=macro-redefined -Wno-error=unused-but-set-variable

$(TWEAK_NAME)_CCFLAGS = -fobjc-arc -fvisibility=hidden -std=c++11 \
  -Wno-error=deprecated-non-prototype -Wno-error=macro-redefined -Wno-error=unused-but-set-variable

H5GG_LOGOS_DEFAULT_GENERATOR = internal


include $(THEOS_MAKE_PATH)/tweak.mk

clean::
	rm -rf ./packages/*
