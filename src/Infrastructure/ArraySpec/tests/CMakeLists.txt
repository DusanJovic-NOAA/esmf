set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_ArraySpecUTest
              SOURCES ESMF_ArraySpecUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_ArraySpecUTest
              SOURCES ESMC_ArraySpecUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")
