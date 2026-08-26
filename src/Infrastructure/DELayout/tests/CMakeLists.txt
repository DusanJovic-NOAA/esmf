set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_DELayoutUTest
              SOURCES ESMF_DELayoutUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_DELayoutWorkQueueUTest
              SOURCES ESMF_DELayoutWorkQueueUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")
