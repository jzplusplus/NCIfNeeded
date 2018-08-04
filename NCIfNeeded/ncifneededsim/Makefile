include $(THEOS)/makefiles/common.mk

TARGET = simulator:clang
ARCH = x86_64

TWEAK_NAME = ncifneededsim
ncifneededsim_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
