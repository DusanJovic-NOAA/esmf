set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_RouteHandleUTest
              SOURCES ESMF_RouteHandleUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_RouteHandleAdvancedUTest
              SOURCES ESMF_RouteHandleAdvancedUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_RouteHandleUTest
              SOURCES ESMC_RouteHandleUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
")
