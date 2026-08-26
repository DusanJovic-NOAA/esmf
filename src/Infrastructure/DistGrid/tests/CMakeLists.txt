set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_DistGridCreateGetUTest
              SOURCES ESMF_DistGridCreateGetUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_DistGridUTest
              SOURCES ESMC_DistGridUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")
