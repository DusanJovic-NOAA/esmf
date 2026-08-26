set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_HConfigUTest
              SOURCES ESMF_HConfigUTest.F90
              NP 4
              MPIUNI
              LABELS "unit_tests"
              PRE_RUN_SCRIPT "
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/sample.rc .
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/sample.yaml .
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/iterequalrepro.yaml .
")
