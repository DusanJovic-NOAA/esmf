set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

esmf_add_test(NAME ESMF_MeshEx
              SOURCES ESMF_MeshEx.F90
              NP 4
              LABELS "examples_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
chmod u+rw data/*
")
