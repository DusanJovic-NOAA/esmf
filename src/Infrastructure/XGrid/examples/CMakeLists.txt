set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_XGridEx
              SOURCES ESMF_XGridEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_XGridSparseMatEx
              SOURCES ESMF_XGridSparseMatEx.F90
              NP 1
              MPIUNI
              LABELS "examples_tests")
