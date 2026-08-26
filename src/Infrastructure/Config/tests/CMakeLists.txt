set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

set(PRE_RUN_SCRIPT "
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/ESMF_Resource_File_Sample.rc ${CMAKE_BINARY_DIR}/tests_rundir/
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/ESMF_Resource_File_Sample2.rc ${CMAKE_BINARY_DIR}/tests_rundir/
")

esmf_add_test(NAME ESMF_ConfigUTest
              SOURCES ESMF_ConfigUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})

esmf_add_test(NAME ESMC_ConfigUTest
              SOURCES ESMC_ConfigUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})
