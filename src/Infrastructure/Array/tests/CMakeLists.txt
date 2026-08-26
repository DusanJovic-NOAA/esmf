set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_ArrayCreateGetUTest
              SOURCES ESMF_ArrayCreateGetUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArrayDataUTest
              SOURCES ESMF_ArrayDataUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArrayScatterUTest
              SOURCES ESMF_ArrayScatterUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArrayGatherUTest
              SOURCES ESMF_ArrayGatherUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArrayIOTypesUTest
              SOURCES ESMF_ArrayIOTypesUTest.F90
              NP 4
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
rm -f ESMF_ArrayIOTypesUTest.nc
")

esmf_add_test(NAME ESMF_ArrayIOUTest
              SOURCES ESMF_ArrayIOUTest.F90
              NP 6
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArraySMMUTest
              SOURCES ESMF_ArraySMMUTest.F90
              NP 6
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArraySMMFromFileUTest
              SOURCES ESMF_ArraySMMFromFileUTest.F90
              NP 6
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
mkdir -p data
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/../../IO/tests/T42_grid.nc data
chmod u+rw data/*
")

esmf_add_test(NAME ESMF_ArrayArbIdxSMMUTest
              SOURCES ESMF_ArrayArbIdxSMMUTest.F90
              NP 6
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArrayRedistUTest
              SOURCES ESMF_ArrayRedistUTest.F90
              NP 6
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArrayRedistPerfUTest
              SOURCES ESMF_ArrayRedistPerfUTest.F90
              NP 6
              LABELS "unit_tests")

esmf_add_test(NAME ESMF_ArrayHaloUTest
              SOURCES ESMF_ArrayHaloUTest.F90
              NP 4
              LABELS "unit_tests")

esmf_add_test(NAME ESMC_ArrayUTest
              SOURCES ESMC_ArrayUTest.c
              NP 4
              LABELS "unit_tests")
