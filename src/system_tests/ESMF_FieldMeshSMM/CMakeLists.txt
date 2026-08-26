set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

get_filename_component(TNAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(APPEND TNAME "STest")

esmf_add_test(NAME ${TNAME}
              SOURCES ${TNAME}.F90 user_coupler.F90 user_model1.F90 user_model2.F90
              NP 4
              LABELS "system_tests")
