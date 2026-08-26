set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMC_StateUTest
              SOURCES ESMC_StateUTest.c
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_StateCreateUTest
              SOURCES ESMF_StateCreateUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_StateUTest
              SOURCES ESMF_StateUTest.F90
              NP 4
              LABELS "unit_tests")
