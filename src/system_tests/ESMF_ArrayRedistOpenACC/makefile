# $Id$ 

ALL: tree_build_system_tests

run: tree_run_system_tests

LOCDIR	  = src/system_tests/ESMF_ArrayRedistOpenACC

SYSTEM_TESTS_BUILD    = $(ESMF_TESTDIR)/ESMF_ArrayRedistOpenACCSTest

# Object files other than SysTest%.o that the
# system tests executable will depend on.
# List objects files in the order that they
# are to be compiled/created.
SYSTEM_TESTS_OBJ      = user_model1.o user_model2.o user_coupler.o

SYSTEM_TESTS_RUN      = RUN_ArrayRedistOpenACC

ESMF_ArrayRedistOpenACCSTest.o : $(SYSTEM_TESTS_OBJ)

include $(ESMF_DIR)/makefile

ifeq ($(ESMF_TESTFORCEOPENACC),ON)
ifeq ($(ESMF_OPENACC),OFF)
ESMF_F90COMPILEOPTS += $(ESMF_OPENACC_F90COMPILEOPTS)
ESMF_F90LINKOPTS    += $(ESMF_OPENACC_F90LINKOPTS)
endif
endif

DIRS = 

CLEANDIRS   =
CLEANFILES  = $(SYSTEM_TESTS_BUILD)
CLOBBERDIRS =


RUN_ArrayRedistOpenACC:
	$(MAKE) TNAME=ArrayRedistOpenACC NP=8 stest
