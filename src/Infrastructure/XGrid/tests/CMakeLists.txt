set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_XGridUTest
              SOURCES ESMF_XGridUTest.F90
              NP 1
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_XGridMaskingUTest
              SOURCES ESMF_XGridMaskingUTest.F90
              NP 2
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_XGridUTest
              SOURCES ESMC_XGridUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")
