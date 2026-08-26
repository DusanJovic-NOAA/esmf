set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_NUOPC_UTest
              SOURCES ESMF_NUOPC_UTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")
