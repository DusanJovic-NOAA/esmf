set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_LocStreamEx
              SOURCES ESMF_LocStreamEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")
