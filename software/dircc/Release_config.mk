#START GENERATED

# The following TYPE comment allows tools to identify the 'type' of target this 
# makefile is associated with. 
# TYPE: LIB_MAKEFILE

# This following VERSION comment indicates the version of the tool used to 
# generate this makefile. A makefile variable is provided for VERSION as well. 
# ACDS_VERSION: 16.1
ACDS_VERSION := 16.1

# This following BUILD_NUMBER comment indicates the build number of the tool 
# used to generate this makefile. 
# BUILD_NUMBER: 196


# The library name (without a "lib" prefix or ".a" suffix).
#
# It may be used by the makefile fragments so is defined before including them.
#
LIB_NAME := dircc

# Paths to C, C++, and assembly source files.
C_SRCS :=
CXX_SRCS :=
ASM_SRCS :=
SRC_DIR_01 := $(call adjust-path,src)
SDIR_C_SRCS += $(SRC_DIR_01)/dircc_init.c
SDIR_C_SRCS += $(SRC_DIR_01)/dircc_main.c
SDIR_C_SRCS += $(SRC_DIR_01)/dircc_on_idle.c
SDIR_C_SRCS += $(SRC_DIR_01)/dircc_on_receive.c
SDIR_C_SRCS += $(SRC_DIR_01)/dircc_on_send.c
SDIR_C_SRCS += $(SRC_DIR_01)/dircc_rts.c
SDIR_C_SRCS += $(SRC_DIR_01)/dircc_system_interface.c
SDIR_C_SRCS += $(SRC_DIR_01)/dircc_system_state.c
SDIR_CXX_SRCS :=
SDIR_ASM_SRCS :=


# Path to root of object file tree.
OBJ_ROOT_DIR := obj

# Common arguments for LIB_CFLAGS
LIB_CFLAGS_DEFINED_SYMBOLS := -DNDEBUG
LIB_CFLAGS_UNDEFINED_SYMBOLS :=
LIB_CFLAGS_OPTIMIZATION := -Os
LIB_CFLAGS_DEBUG_LEVEL :=
LIB_CFLAGS_WARNINGS := -Wall
LIB_CFLAGS_USER_FLAGS :=

LIB_ASFLAGS_USER :=

# Common arguments for LIB_ARCHIVER_FLAGS
LIB_ARCHIVER_FLAGS := -src

# List of library specific include directories
LIB_INCLUDE_DIRS := include

# Pre- and post- processor settings.
BUILD_PRE_PROCESS :=
BUILD_POST_PROCESS :=

# Define path to the root of the BSP.
BSP_ROOT_DIR := ../dircc_system_node_test_bsp

# List of public include directories for -I compiler option (-I added when used).


#END GENERATED
