set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_BaseUTest
              SOURCES ESMF_BaseUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_BaseUTest
              SOURCES ESMCI_BaseUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_NlohmannJSONUTest
              SOURCES ESMCI_NlohmannJSONUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_InfoUTest
              SOURCES ESMCI_InfoUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_InfoUTest
              SOURCES ESMF_InfoUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_InfoArrayUTest
              SOURCES ESMF_InfoArrayUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")
