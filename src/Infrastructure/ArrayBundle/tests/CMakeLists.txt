set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_ArrayBundleCreateUTest
              SOURCES ESMF_ArrayBundleCreateUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArrayBundleRedistUTest
              SOURCES ESMF_ArrayBundleRedistUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArrayBundleIOUTest
              SOURCES ESMF_ArrayBundleIOUTest.F90
              NP 4
              LABELS "unit_tests")
