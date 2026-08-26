set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_ContainerUTest
              SOURCES ESMF_ContainerUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")
