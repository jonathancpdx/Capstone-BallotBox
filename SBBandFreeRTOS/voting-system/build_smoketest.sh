#!/bin/bash

# An all-options combinatorial build test to completely smoketest all
# build variants.

# Here are all current options for environmental variables that drive
# builds.

# TARGET=freertos
# TARGET=bottom
# TARGET=posix
# TARGET=verification
# TARGET=hosttests
# TARGET=sim
# TARGET=deploy

# FPGA=vcu118
# FPGA=no

# PLATFORM=AVR
# PLATFORM=RV32

# The following constraints denote which combinations of these values
# are valid.

# Building for the VCU 118 FPGA current mandates that we are building
# a RISC-V binary.
# FPGA == vcu118 => PLATFORM == RV32

# Platform is effectively ignored for the `bottom` and `posix`
# targets, as they are designed only to work on POSIX/X86 hosts.
# TARGET == bottom => PLATFORM == X86
# TARGET == posix => PLATFORM == X86

# Our FreeRTOS main currently presumes that all hardware devices are
# present, including Ethernet even if networking is disabled.
# (TARGET == freertos && PLATFORM = RV32) => FPGA == vcu118

make TARGET=bottom        clean bottom_all

# Host tests currently are clang/X86 only.  See #232 and #233.
make TARGET=hosttests     clean hosttest_all

make TARGET=posix         clean posix_all

make TARGET=freertos      PLATFORM=AVR     FPGA=no     clean fpga
# We cannot currently build an RV32 build that is independent of the VCU 118.  See 
make TARGET=freertos      PLATFORM=RV32    FPGA=no     clean freertos_all
make TARGET=freertos      PLATFORM=RV32    FPGA=vcu118 clean freertos_all

make TARGET=verification  clean typecheck_all verify_all

# AVR platforms are not yet supported for simulation.  See #238.
# make TARGET=sim          PLATFORM=AVR     FPGA=no   clean sim_all
make TARGET=sim           PLATFORM=RV32    FPGA=no   clean sim_all

make TARGET=deploy        all_boxes
