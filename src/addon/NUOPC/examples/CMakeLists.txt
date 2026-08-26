set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_NUOPCBasicModelEx
              SOURCES ESMF_NUOPCBasicModelEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_NUOPCAtmModelEx
              SOURCES ESMF_NUOPCAtmModelEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")
