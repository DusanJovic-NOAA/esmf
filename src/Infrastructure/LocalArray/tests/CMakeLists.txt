set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_LocalArrayDataUTest
              SOURCES ESMF_LocalArrayDataUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_LocalArrayUTest
              SOURCES ESMF_LocalArrayUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")
