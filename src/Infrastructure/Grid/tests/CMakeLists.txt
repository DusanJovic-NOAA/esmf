set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMC_GridUTest
              SOURCES ESMC_GridUTest.c
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
")

esmf_add_test(NAME ESMF_GridCreateUTest
              SOURCES ESMF_GridCreateUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
mkdir -p data
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/data/*.nc data/
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/../../Field/tests/data/*.nc data/
chmod u+rw data/*
")

esmf_add_test(NAME ESMF_GridCoordUTest
              SOURCES ESMF_GridCoordUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_GridItemUTest
              SOURCES ESMF_GridItemUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_GridArbitraryUTest
              SOURCES ESMF_GridArbitraryUTest.F90
              NP 4
              LABELS "unit_tests")
