

# 0 - release
# 1 - debug
BUILD_TYPE = 1

#gem2-diag
ifndef PROJECT_TYPE
PROJECT_TYPE = sam4e-xp
endif 

#cortex-m4.cmake
TOOLCHAIN_FILE = cortex-m4.cmake

#FORMAT: IIII - board id
#0000 - type NULL
#0100 - sam4-xp
ifndef BOARD_TYPE
BOARD_TYPE = 0001
endif

ifndef BOARD_REVISION_MAJOR
BOARD_REVISION_MAJOR = 01
endif
ifndef BOARD_REVISION_MINOR
BOARD_REVISION_MINOR = 00
endif

BOARD_REVISION = $(BOARD_REVISION_MAJOR)$(BOARD_REVISION_MINOR)

ifndef SCM_SET_REVISION 
ifneq ($(shell test -d .svn), 0)
SCM_SET_REVISION:= $(shell svnversion -n . | sed 's/\([0-9]*\).*/\1/')
endif

ifneq ($(shell test -d .git), 0)
SCM_SET_REVISION:= $(shell git rev-parse --short HEAD)
endif
endif

ifndef SW_RC
#example SW_RC = -rc.1
SW_RC = 
endif

ifndef SW_MAJOR
SW_MAJOR = 1
endif

ifndef SW_MINOR
SW_MINOR = 4
endif

ifndef SW_PATCH
SW_PATCH = 0
endif

#FORMAT MMmmPP
#MM   -  version major
#mm   -  version minor
#PP   -  version patch
SW_VERSION = $(SW_MAJOR).$(SW_MINOR).$(SW_PATCH)$(SW_RC)-$(SCM_SET_REVISION)


generate:
	rm -rf build_$(PROJECT_TYPE)
	mkdir build_$(PROJECT_TYPE)
	cd build_$(PROJECT_TYPE) && 							\
	cmake 													\
	-G"Unix Makefiles" 										\
	-DBUILD_TYPE=$(BUILD_TYPE)								\
	-DPROJECT_TYPE=$(PROJECT_TYPE)							\
	-DSW_VERSION=$(SW_VERSION)								\
	-DBOARD_TYPE=$(BOARD_TYPE)								\
	-DBOARD_REVISION_MAJOR=$(BOARD_REVISION_MAJOR)			\
	-DBOARD_REVISION=$(BOARD_REVISION)						\
	-DSCM_SET_REVISION=$(SCM_SET_REVISION)					\
	-DCMAKE_TOOLCHAIN_FILE=../sdk/toolchain/$(TOOLCHAIN_FILE) ..
	

clean:
	rm -rf build_$(PROJECT_TYPE)
	
clean_all:
	rm -rf build_*
	
print-%: ; @echo $* is $($*)
