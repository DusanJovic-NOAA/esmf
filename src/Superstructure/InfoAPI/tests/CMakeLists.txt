set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_InfoGetInterfaceArrayUTest
              SOURCES ESMF_InfoGetInterfaceArrayUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_InfoSyncUTest
              SOURCES ESMF_InfoSyncUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_InfoDescribeUTest
              SOURCES ESMF_InfoDescribeUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_InfoCacheUTest
              SOURCES ESMF_InfoCacheUTest.F90
              NP 4
              LABELS "unit_tests")
