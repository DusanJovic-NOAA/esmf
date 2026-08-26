set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_FieldBundleUTest
              SOURCES ESMF_FieldBundleUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldBundleCrGetUTest
              SOURCES ESMF_FieldBundleCrGetUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldBundleRedistUTest
              SOURCES ESMF_FieldBundleRedistUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldBundleSMMUTest
              SOURCES ESMF_FieldBundleSMMUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldBundleIOUTest
              SOURCES ESMF_FieldBundleIOUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FieldBundleRegridUTest
              SOURCES ESMF_FieldBundleRegridUTest.F90
              NP 4
              LABELS "unit_tests")
