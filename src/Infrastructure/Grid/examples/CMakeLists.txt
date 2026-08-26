set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_GridUsageEx
              SOURCES ESMF_GridUsageEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests"
              PRE_RUN_SCRIPT "
mkdir -p data
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/data/*.nc data/
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/../../Field/tests/data/*.nc data/
chmod u+rw data/*
")

esmf_add_test(NAME ESMF_GridCreateRegFromDGEx
              SOURCES ESMF_GridCreateRegFromDGEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")
