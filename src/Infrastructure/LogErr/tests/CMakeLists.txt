set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMC_LogErrUTest
              SOURCES ESMC_LogErrUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMCI_LogErrPerfUTest
              SOURCES ESMCI_LogErrPerfUTest.C
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_LogErrUTest
              SOURCES ESMF_LogErrUTest.F90 ESMCI_TestError.C
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
rm -f *Log_Test_File* Single_Log_File
")

esmf_add_test(NAME ESMF_LogErrPerfUTest
              SOURCES ESMF_LogErrPerfUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")
