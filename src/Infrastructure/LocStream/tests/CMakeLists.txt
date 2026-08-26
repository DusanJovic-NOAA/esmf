set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_LocStreamUTest
              SOURCES ESMF_LocStreamUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_LocStreamUTest
              SOURCES ESMC_LocStreamUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")
