set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_HConfigEx
              SOURCES ESMF_HConfigEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests"
              PRE_RUN_SCRIPT "
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/example.yaml .
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/exampleWithTags.yaml .
cp -f ${CMAKE_CURRENT_SOURCE_DIR}/multiDoc.yaml .
")

