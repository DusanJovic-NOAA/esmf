set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_StateEx
              SOURCES ESMF_StateEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")
