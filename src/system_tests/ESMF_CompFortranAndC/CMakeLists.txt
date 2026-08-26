set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

get_filename_component(TNAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(APPEND TNAME "STest")

esmf_add_test(NAME ${TNAME}
              SOURCES ${TNAME}.F90 user_FortranComponent.F90 user_CComponent.c
              NP 6
              MPIUNI
              LABELS "system_tests"
              PRE_RUN_SCRIPT "
cp -r ${CMAKE_CURRENT_SOURCE_DIR}/data .
chmod u+rw data/*
")
