set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_ArrayBundleEx
              SOURCES ESMF_ArrayBundleEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_ArrayBundleHaloEx
              SOURCES ESMF_ArrayBundleHaloEx.F90
              NP 4
              LABELS "examples_tests")
