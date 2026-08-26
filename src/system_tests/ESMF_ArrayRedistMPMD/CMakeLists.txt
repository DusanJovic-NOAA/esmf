set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

get_filename_component(TNAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
set(TNAMEA ESMF_ArrayRedistSTestA)
set(TNAMEB ESMF_ArrayRedistSTestB)

add_executable(${TNAMEA} ${TNAMEA}.F90 user_model1.F90 user_coupler.F90)
add_executable(${TNAMEB} ${TNAMEB}.F90 user_model2.F90 user_coupler.F90)

set_property(TARGET ${TNAMEA} PROPERTY LINKER_LANGUAGE Fortran)
set_property(TARGET ${TNAMEB} PROPERTY LINKER_LANGUAGE Fortran)

target_link_libraries(${TNAMEA} PRIVATE esmf)
target_link_libraries(${TNAMEB} PRIVATE esmf)

set(CUSTOM_RUN_SCRIPT ${CMAKE_BINARY_DIR}/tests_rundir/run_custom_mpmd_script.sh)

add_test(NAME ${TNAME} COMMAND ${CUSTOM_RUN_SCRIPT})

# Create custom script just for this MPMD test
set(RUN_SCRIPT "#!/bin/bash
set -eux

ESMF_MPIMPMDRUN='mpiexec --oversubscribe'

\${ESMF_MPIMPMDRUN} -n 4 ./ESMF_ArrayRedistSTestA : -n 2 ./ESMF_ArrayRedistSTestB > ./ESMF_ArrayRedistSTestA.stdout
cat ./PET*ArrayRedistSTest*.Log > ./ESMF_ArrayRedistSTestA.Log
rm -f ./PET*ArrayRedistSTest*.Log
")

file(WRITE ${CUSTOM_RUN_SCRIPT} ${RUN_SCRIPT})
file(CHMOD ${CUSTOM_RUN_SCRIPT} PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ)

