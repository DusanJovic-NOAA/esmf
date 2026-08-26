set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_DistGridEx
              SOURCES ESMF_DistGridEx.F90
              NP 4
              LABELS "examples_tests")
