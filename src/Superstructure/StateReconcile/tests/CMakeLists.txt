set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_StateReconcileUTest
              SOURCES ESMF_StateReconcileUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_StateReconcileProxyUTest
              SOURCES ESMF_StateReconcileProxyUTest.F90
              NP 4
              LABELS "unit_tests")
