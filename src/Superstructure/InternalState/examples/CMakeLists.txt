set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_InternalStateEx
              SOURCES ESMF_InternalStateEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_InternalStateModEx
              SOURCES ESMF_InternalStateModEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")
