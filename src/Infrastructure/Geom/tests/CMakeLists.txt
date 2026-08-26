set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_GeomUTest
              SOURCES ESMF_GeomUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")
