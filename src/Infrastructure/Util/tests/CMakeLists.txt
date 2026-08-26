set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_UtilUTest
              SOURCES ESMF_UtilUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_FortranWordsizeUTest
              SOURCES ESMF_FortranWordsizeUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_TypeKindGetUTest
              SOURCES ESMF_TypeKindGetUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_InitMacrosUTest
              SOURCES ESMF_InitMacrosUTest.F90 ESMF_InitMacrosTestTypes.F90
              NP 4
              LABELS "unit_tests")
