set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_TestUTest
              SOURCES ESMF_TestUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_TestUTest
              SOURCES ESMCI_TestUTest.C
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_TestUTest
              SOURCES ESMC_TestUTest.c
              NP 4
              LABELS "unit_tests")
