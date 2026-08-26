set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_InternalStateUTest
              SOURCES ESMF_InternalStateUTest.F90
              NP 4
              LABELS "unit_tests")
