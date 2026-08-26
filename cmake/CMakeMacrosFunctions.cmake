# ESMF specific cmake macros

#
# Copies all files (typicaly headers) listed in ${STOREH}
# from local ../include to top-level src/include/
#
macro (copy_storeh)
   execute_process(
        COMMAND mkdir -p ${CMAKE_BINARY_DIR}/src/include/
        COMMAND cp ${STOREH} ${CMAKE_BINARY_DIR}/src/include/
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../include
    )
endmacro()


#
# Preprocess all cppF90 files listed in ${AUTOGEN} to create
# new .F90 file and add it to SOURCEF list
#
macro (run_cppF90_to_F90)
    foreach(out_file ${AUTOGEN})
        STRING(REGEX REPLACE ".F90" ".cppF90" in_file ${out_file})
        execute_process(
            COMMAND ${CMAKE_SOURCE_DIR}/cmake/scripts/cppF90_to_F90.sh ${CMAKE_CURRENT_SOURCE_DIR}/${in_file} ${out_file} ${CMAKE_BINARY_DIR}/src/include
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        )
        list(APPEND SOURCEF ${CMAKE_CURRENT_BINARY_DIR}/${out_file})
    endforeach()
endmacro()

function(esmf_add_test)

    set(options MPIUNI)
    set(oneValueArgs NAME NP MPIRUN_ENV PRE_RUN_SCRIPT POST_RUN_SCRIPT LABELS)
    set(multiValueArgs SOURCES)
    cmake_parse_arguments(PARSE_ARGV 0 arg "${options}" "${oneValueArgs}" "${multiValueArgs}")

    # The above will set or unset variables with the following names:
    #   arg_OPTIONAL
    #   arg_NAME
    #   arg_NP
    #   arg_SOURCES
    #
    # The following will also be set or unset:
    #   arg_UNPARSED_ARGUMENTS
    #   arg_KEYWORDS_MISSING_VALUES

    if(arg_UNPARSED_ARGUMENTS)
        message(WARNING "esmf_add_test: UNPARSED_ARGUMENTS ${arg_UNPARSED_ARGUMENTS}")
    endif()
    if(arg_KEYWORDS_MISSING_VALUES)
        message(WARNING "esmf_add_test: KEYWORDS_MISSING_VALUES ${arg_KEYWORDS_MISSING_VALUES}")
    endif()

    if(arg_MPIUNI AND ESMF_COMM STREQUAL "mpiuni")
        set(ESMF_MPIRUN "mpiuni")
    else()
        if(ESMF_COMM STREQUAL "mpiuni")
            return()
        endif()
    endif()

    # generate PRE_RUN_SCRIPT file in the run directory
    if(arg_PRE_RUN_SCRIPT)
         set(PRE_RUN_SCRIPT_FILE "pre_${arg_NAME}.sh")
         set(RUN_SCRIPT "#!/bin/bash
set -eux
${arg_PRE_RUN_SCRIPT}
")
         file(WRITE "${CMAKE_BINARY_DIR}/tests_rundir/${PRE_RUN_SCRIPT_FILE}" ${RUN_SCRIPT})
         file(CHMOD "${CMAKE_BINARY_DIR}/tests_rundir/${PRE_RUN_SCRIPT_FILE}" PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ)
    endif()

    # generate POST_RUN_SCRIPT file in the run directory
    if(arg_POST_RUN_SCRIPT)
         set(POST_RUN_SCRIPT_FILE "post_${arg_NAME}.sh")
         set(RUN_SCRIPT "#!/bin/bash
set -eux
${arg_POST_RUN_SCRIPT}
")
         file(WRITE "${CMAKE_BINARY_DIR}/tests_rundir/${POST_RUN_SCRIPT_FILE}" ${RUN_SCRIPT})
         file(CHMOD "${CMAKE_BINARY_DIR}/tests_rundir/${POST_RUN_SCRIPT_FILE}" PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ)
    endif()


    # Assumes the first file is SOURCES list is the main program
    list(POP_FRONT arg_SOURCES testProgram)

    add_executable(${arg_NAME} ${testProgram})
    get_source_file_property(testProgramLANGUAGE ${testProgram} LANGUAGE)
    set_property(TARGET ${arg_NAME} PROPERTY LINKER_LANGUAGE ${testProgramLANGUAGE})

    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

    target_sources(${arg_NAME} PRIVATE ${arg_SOURCES})
    target_link_libraries(${arg_NAME} PRIVATE esmf)

    add_test(NAME ${arg_NAME}
             COMMAND ${CMAKE_SOURCE_DIR}/cmake/scripts/run_test.sh
                                         ${arg_NAME}
                                         ${arg_NP}
                                         ${PRE_RUN_SCRIPT_FILE}
                                         ${POST_RUN_SCRIPT_FILE}
             WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/tests_rundir)

    if(NOT arg_LABELS)
        message(WARNING "No label set for ${arg_NAME}")
    endif()

    set(test_LABELS ${arg_LABELS})

    if(TEST_LABEL1)
        list(APPEND test_LABELS ${TEST_LABEL1})
    endif()

    if(test_LABELS)
        set_tests_properties(${arg_NAME} PROPERTIES LABELS "${test_LABELS}")
    else()
        message(WARNING "No label set for ${arg_NAME}")
    endif()

    if(arg_MPIRUN_ENV)
        set_tests_properties(${arg_NAME} PROPERTIES ENVIRONMENT "${arg_MPIRUN_ENV}")
    endif()

endfunction()
