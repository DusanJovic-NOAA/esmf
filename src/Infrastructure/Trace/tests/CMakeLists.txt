set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

   # ifeq ($(ESMF_TRACE_LIB_BUILD),ON)
   #       # activate trace testing
   #       ESMF_F90COMPILEOPTS += -DESMF_TESTTRACE
   #       ifneq ($(ESMF_TRACE_BUILD_SHARED),ON)
   #             # add link options for static builds
   #             ESMF_F90LINKOPTS += $(ESMF_TRACE_STATICLINKOPTS)
   #             ESMF_F90ESMFLINKLIBS += $(ESMF_TRACE_STATICLINKLIBS)
   #       else
   #             ifeq ($(ESMF_TRACE_PRELOAD_LINKED),ON)
   #                   ESMF_F90LINKLIBS := $(ESMF_TRACE_DYNAMICLINKLIBS) $(ESMF_F90LINKLIBS)
   #                   ESMF_TESTTRACE_TARGET = ftest_profile_preload
   #             else
   #                   # set dynamic preload trace test target
   #                   ESMF_TESTTRACE_TARGET = ftest_profile_preload
   #             endif
   #       endif
   # endif

include_directories(../include)

esmf_add_test(NAME ESMF_TraceClkMonoUTest
              SOURCES ESMF_TraceClkMonoUTest.F90
              NP 4
				  MPIRUN_ENV "ESMF_RUNTIME_TRACE=ON;ESMF_RUNTIME_TRACE_CLOCK=MONOTONIC"
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_TraceClkMonoSyncUTest
              SOURCES ESMF_TraceClkMonoSyncUTest.F90
              NP 4
				  MPIRUN_ENV "ESMF_RUNTIME_TRACE=ON;ESMF_RUNTIME_TRACE_CLOCK=MONOTONIC"
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_TraceUTest
              SOURCES ESMF_TraceUTest.F90 ESMF_SimpleComp.F90
              NP 4
              MPIRUN_ENV "ESMF_RUNTIME_TRACE=ON"
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_TraceIOUTest
              SOURCES ESMF_TraceIOUTest.F90
              NP 4
              MPIRUN_ENV "ESMF_RUNTIME_TRACE=ON"
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
rm -rf ESMF_TraceIOUTest_traceout
"
              POST_RUN_SCRIPT "
mv ./traceout ./ESMF_TraceIOUTest_traceout
")

esmf_add_test(NAME ESMF_TraceMPIUTest
              SOURCES ESMF_TraceMPIUTest.F90
              NP 4
              MPIUNI
              MPIRUN_ENV "ESMF_RUNTIME_TRACE=ON"
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
rm -rf ESMF_TraceMPIUTest_traceout
"
              POST_RUN_SCRIPT "
mv ./traceout ./ESMF_TraceMPIUTest_traceout
")

esmf_add_test(NAME ESMCI_TraceRegionUTest
              SOURCES ESMCI_TraceRegionUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_TraceRegionUTest
              SOURCES ESMC_TraceRegionUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ProfileUTest
              SOURCES ESMF_ProfileUTest.F90 ESMF_SimpleCompB.F90
              NP 8
              MPIRUN_ENV "ESMF_RUNTIME_PROFILE=ON;ESMF_RUNTIME_PROFILE_OUTPUT=\"TEXT BINARY SUMMARY\""
              LABELS "unit_tests")
