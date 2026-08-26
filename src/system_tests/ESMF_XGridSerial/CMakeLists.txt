set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

get_filename_component(TNAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(APPEND TNAME "STest")

esmf_add_test(NAME ${TNAME}
              SOURCES ${TNAME}.F90 util_mod.F90 atmos_comp.F90 land_comp.F90 ocean_comp.F90 coupler_comp.F90
              NP 4
              MPIUNI
              LABELS "system_tests")
