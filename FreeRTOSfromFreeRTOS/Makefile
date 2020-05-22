# fpga/sim are unconditionally defined,
# so set the default target to freertos
TARGET = freertos
$(info TARGET=$(TARGET))

# List all substems directories
export SOURCE_DIR       = /home/nick/Downloads/Capstone-BallotBox/FreeRTOSfromFreeRTOS
export SBB_DIR          = $(SOURCE_DIR)/SBBsource/sbb
export LOG_DIR          = $(SOURCE_DIR)/SBBsource/logging
export CRYPTO_DIR       = $(SOURCE_DIR)/SBBsource/crypto
export CRYPTO_TEST_DIR  = $(SOURCE_DIR)/SBBsource/tests/crypto
export LOGGING_TEST_DIR = $(SOURCE_DIR)/SBBsource/tests/logging
export SBB_TEST_DIR     = $(SOURCE_DIR)/SBBsource/tests/sbb
export INCLUDE_DIR      = $(SOURCE_DIR)/SBBsource/include

# Set correct C header location for macOS 10.14+ hosts
UNAME := $(shell uname)
ifeq ($(UNAME),Darwin)
    export CPATH = $(shell xcrun --show-sdk-path)/usr/include
endif

# Expected GFE repo location (for flash scripts)
CURRENT_PATH       = $(shell pwd)
GFE_DIR           ?= $(CURRENT_PATH)/../gfe
P1_BITSTREAM_PATH ?= $(GFE_DIR)/bitstreams/soc_chisel_p1.bit

# To enable the running lights task
export USE_LED_BLINK_TASK=1

.PHONY: all posix_all bottom_all freertos_all typecheck_all verify_all
.PHONY: sim fpga
.PHONY: clean clean_all clean_crypto clean_logging clean_sbb
.PHONY: hosttest_all crypto_hosttest_clean logging_hosttest_clean sbb_hosttest_clean
.PHONY: sim_all sim_crypto sim_logging sim_sbb
.PHONY: all_boxes upload_binary_box1 upload_binary_box2 upload_binary_box3 upload_binary_box4
.PHONY: upload_binary_sim upload_binary_and_bitstream_sim upload_binary_fpga upload_binary_and_bitstream_sim
.PHONY: posix_crypto posix_logging posix_sbb
.PHONY: freertos_crypto freertos_logging freertos_sbb
.PHONY: typecheck_crypto typecheck_logging typecheck_sbb
.PHONY: verify_crypto verify_logging verify_sbb
.PHONY: crypto_hosttest_all logging_hosttest_all sbb_hosttest_all

#####################################
#
#		SBB targets
#
#####################################
all: sim avr

avr:
	cd $(SOURCE_DIR)/SBBsource ; \
	$(MAKE) -f Makefile.AVR default
	cp $(SOURCE_DIR)/default_ballot_box.* .

sim:
	cd $(SOURCE_DIR) ; \
	$(MAKE) -f Makefile.AVR_sim default
	cp $(SOURCE_DIR)/default_ballot_box_sim.* .


clean_all:
	cd $(SOURCE_DIR) ; \
	$(MAKE) -f Makefile.AVR clean
	cd $(SOURCE_DIR) ; \
	$(MAKE) -f Makefile.AVR_sim clean
	rm -f default_ballot_box.*
	rm -f default_ballot_box_sim.*

#####################################
#
#		FREERTOS targets
#
#####################################
ifeq ($(TARGET),freertos)

freertos_all: freertos_crypto freertos_logging freertos_sbb

clean: clean_sbb clean_crypto clean_logging

freertos_crypto:
	cd $(SOURCE_DIR) ; \
	$(MAKE) -f Makefile.freertos crypto

freertos_logging:
	cd $(SOURCE_DIR) ; \
	$(MAKE) -f Makefile.freertos logging

freertos_sbb:
	cd $(SOURCE_DIR) ; \
	$(MAKE) -f Makefile.freertos sbb

clean_crypto:
	cd $(SOURCE_DIR) ; \
	$(MAKE) -f Makefile.freertos clean

clean_logging:
	cd $(SOURCE_DIR) ; \
	$(MAKE) -f Makefile.freertos clean

clean_sbb:
	cd $(SOURCE_DIR) ; \
	$(MAKE) -f Makefile.freertos clean_sbb

endif # ($(TARGET),freertos)
