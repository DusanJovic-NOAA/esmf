set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

set(PRE_RUN_SCRIPT "
mkdir -p data
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/data/*.nc data
chmod u+rw data/*
")

esmf_add_test(NAME ESMF_RegridWeightGenUTest
              SOURCES ESMF_RegridWeightGenUTest.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})

esmf_add_test(NAME ESMF_FileRegridUTest
              SOURCES ESMF_FileRegridUTest.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT ${PRE_RUN_SCRIPT})
