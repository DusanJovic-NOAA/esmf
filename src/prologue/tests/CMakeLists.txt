set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_StringUTest
              SOURCES ESMF_StringUTest.F90 ESMCI_StringSubr.C
              NP 2
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_WordsizeUTest
              SOURCES ESMF_WordsizeUTest.F90 ESMCI_WordsizeSubr.C
              NP 2
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_F90ArrayPtrUTest
              SOURCES ESMF_F90ArrayPtrUTest.F90
              NP 2
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_LAPACKUTest
              SOURCES ESMF_LAPACKUTest.F90
              NP 2
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FeatureUTest
              SOURCES ESMF_FeatureUTest.F90 ESMCI_FeatureSubr.C ESMF_FeatureTR15581Subr.F90
              NP 2
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ExceptionsUTest
              SOURCES ESMF_ExceptionsUTest.F90 ESMCI_ExceptionsSubr.C
              NP 2
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_ExceptionsUTest
              SOURCES ESMCI_ExceptionsUTest.C
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_FeatureUTest
              SOURCES ESMCI_FeatureUTest.C ESMF_FeatureSubr.F90
              NP 2
              LABELS "unit_tests")
