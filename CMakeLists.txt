cmake_minimum_required(VERSION 3.19)

project(ESMF VERSION 8.9.1 LANGUAGES C CXX Fortran)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

include(CMakePrintHelpers)
include(cmake/CMakeMacrosFunctions.cmake)

set(ESMF_DIR ${CMAKE_SOURCE_DIR})
include(cmake/esmf_defaults.cmake)


message(STATUS "ESMF_OS .......... ${ESMF_OS}")
message(STATUS "ESMF_COMPILER .... ${ESMF_COMPILER}")
message(STATUS "ESMF_SITE ........ ${ESMF_SITE}")
message(STATUS "ESMF_BOPT ........ ${ESMF_BOPT} (${CMAKE_BUILD_TYPE})")

###############################################################################
### Build Options
###############################################################################
option(ENABLE_MPI    "Enable MPI"    ON)
option(ENABLE_OPENMP "Enable OpenMP" ON)
option(ENABLE_INTERNAL_YAMLCPP "Enable internal YAML-CPP" ON)

option(ENABLE_UNIT_TESTS       "Enable unit tests" OFF)
option(ENABLE_SYSTEM_TESTS     "Enable system tests" OFF)
option(ENABLE_EXAMPLES_TESTS   "Enable examples tests" OFF)

message(STATUS "")
message(STATUS "ENABLE_MPI ....... ${ENABLE_MPI}")
message(STATUS "ENABLE_OPENMP .... ${ENABLE_OPENMP}")

message(STATUS "ENABLE_UNIT_TESTS ......... ${ENABLE_UNIT_TESTS}")
message(STATUS "ENABLE_SYSTEM_TESTS ....... ${ENABLE_SYSTEM_TESTS}")
message(STATUS "ENABLE_EXAMPLES_TESTS ..... ${ENABLE_EXAMPLES_TESTS}")

message(STATUS "")

include(cmake/ESMF_Compiler_Flags.cmake)

###############################################################################
### Find Dependencies
###############################################################################
if(ENABLE_MPI)
  set(MPI_DETERMINE_LIBRARY_VERSION true)
  find_package(MPI REQUIRED C CXX Fortran)

  if(MPI_C_LIBRARY_VERSION_STRING MATCHES ".*CRAY MPICH.*")
    set(ESMF_COMM "mpi")
  elseif(MPI_C_LIBRARY_VERSION_STRING MATCHES ".*MPICH.*")
    set(ESMF_COMM "mpich")
  elseif(MPI_C_LIBRARY_VERSION_STRING MATCHES ".*Open MPI.*")
    set(ESMF_COMM "openmpi")
  elseif(MPI_C_LIBRARY_VERSION_STRING MATCHES ".*HPE MPT.*")
    set(ESMF_COMM "mpt")
  elseif(MPI_C_LIBRARY_VERSION_STRING MATCHES ".*Intel.*")
    set(ESMF_COMM "intelmpi")
  elseif(MPI_C_LIBRARY_VERSION_STRING MATCHES ".*MVAPICH2.*")
    set(ESMF_COMM "mvapich2")
  else()
    message(STATUS "MPI_C_LIBRARY_VERSION_STRING = '${MPI_C_LIBRARY_VERSION_STRING}'")
    message(STATUS "MPI_C_VERSION_MAJOR = '${MPI_C_VERSION_MAJOR}'")
    message(FATAL_ERROR "Cannot detect MPI type for ESMF")
  endif()
else()
  set(ESMF_COMM "mpiuni")
endif()

if(ENABLE_OPENMP)
  # set(CMAKE_FIND_DEBUG_MODE TRUE)
  find_package(OpenMP REQUIRED C CXX Fortran)
  # set(CMAKE_FIND_DEBUG_MODE FALSE)
  if(NOT OpenMP_FOUND)
     set(ESMF_OPENMP OFF)
  endif()
  message(STATUS "OpenMP version ${OpenMP_VERSION}")
  if(OpenMP_VERSION VERSION_GREATER_EQUAL 4.0)
    set(ESMF_OPENMP OMP4)
  endif()
else()
  set(ESMF_OPENMP OFF)
endif()

if(DEFINED ESMF_NETCDF OR DEFINED ENV{ESMF_NETCDF})
    if(DEFINED ESMF_NETCDF)
        message(STATUS "Explicitly set ESMF_NETCDF takes highest priority. ESMF_NETCDF=${ESMF_NETCDF}")
    else()
        message(STATUS "Environment variable ESMF_NETCDF is defined. ESMF_NETCDF=$ENV{ESMF_NETCDF}")
        set(ESMF_NETCDF "$ENV{ESMF_NETCDF}")
    endif()

    # define the rest of ESMF_NETCDF_* variables depending on the value of ESMF_NETCDF
    # https://earthsystemmodeling.org/docs/release/latest/ESMF_usrdoc/node10.html#sec:netcdf

    if(ESMF_NETCDF STREQUAL "nc-config")
        # ESMF_NETCDF_INCLUDE
        execute_process(COMMAND /bin/sh -c "nc-config --includedir" OUTPUT_VARIABLE ESMF_NETCDF_INCLUDE  OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_VARIABLE NC_CONF_ERROR)
        if(NC_CONF_ERROR)
            message(FATAL_ERROR "Executing nc-config failed: ${NC_CONF_ERROR}")
        endif()
        execute_process(COMMAND /bin/sh -c "nf-config --includedir" OUTPUT_VARIABLE ESMF_NETCDFF_INCLUDE OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_VARIABLE NC_CONF_ERROR)
        if(NC_CONF_ERROR)
            message(FATAL_ERROR "Executing nf-config failed: ${NC_CONF_ERROR}")
        endif()

        ### ESMF_NETCDF_LIBS
        execute_process(COMMAND /bin/sh -c "nc-config --libs" OUTPUT_VARIABLE ESMF_NETCDF_LIBS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_VARIABLE NC_CONF_ERROR)
        if(NC_CONF_ERROR)
            message(FATAL_ERROR "Executing nc-config failed: ${NC_CONF_ERROR}")
        endif()
        string(REGEX REPLACE "-L[^ ]*" "" ESMF_NETCDF_LIBS "${ESMF_NETCDF_LIBS}")
        string(STRIP ${ESMF_NETCDF_LIBS} ESMF_NETCDF_LIBS)
        execute_process(COMMAND /bin/sh -c "nf-config --flibs" OUTPUT_VARIABLE ESMF_NETCDFF_LIBS OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_VARIABLE NC_CONF_ERROR)
        if(NC_CONF_ERROR)
            message(FATAL_ERROR "Executing nf-config failed: ${NC_CONF_ERROR}")
        endif()
        string(REGEX REPLACE "-L[^ ]*" "" ESMF_NETCDFF_LIBS "${ESMF_NETCDFF_LIBS}")
        string(STRIP ${ESMF_NETCDFF_LIBS} ESMF_NETCDFF_LIBS)

        # ESMF_NETCDF_LIBPATH
        execute_process(COMMAND /bin/sh -c "nc-config --libdir" OUTPUT_VARIABLE ESMF_NETCDF_LIBPATH OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_VARIABLE NC_CONF_ERROR)
        if(NC_CONF_ERROR)
            message(FATAL_ERROR "Executing nc-config failed: ${NC_CONF_ERROR}")
        endif()
        execute_process(COMMAND /bin/sh -c "nf-config --flibs" OUTPUT_VARIABLE ESMF_NETCDFF_LIBPATH OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_VARIABLE NC_CONF_ERROR)
        if(NC_CONF_ERROR)
            message(FATAL_ERROR "Executing nf-config failed: ${NC_CONF_ERROR}")
        endif()
        string(REGEX REPLACE "-L" "" ESMF_NETCDFF_LIBPATH "${ESMF_NETCDFF_LIBPATH}")
        string(REGEX REPLACE "-l[^ ]*" "" ESMF_NETCDFF_LIBPATH "${ESMF_NETCDFF_LIBPATH}")
        string(STRIP ${ESMF_NETCDFF_LIBPATH} ESMF_NETCDFF_LIBPATH)
    elseif(ESMF_NETCDF STREQUAL "split" OR ESMF_NETCDF STREQUAL "standard")
        if(NOT DEFINED ESMF_NETCDF_INCLUDE)
            if(DEFINED ENV{ESMF_NETCDF_INCLUDE})
                set(ESMF_NETCDF_INCLUDE "$ENV{ESMF_NETCDF_INCLUDE}")
            else()
                message(WARNING "ESMF_NETCDF_INCLUDE is not explicitly defined")
            endif()
        endif()
        if(NOT DEFINED ESMF_NETCDF_LIBS)
            if(DEFINED ENV{ESMF_NETCDF_LIBS})
                set(ESMF_NETCDF_LIBS "$ENV{ESMF_NETCDF_LIBS}")
            else()
                if(ESMF_NETCDF STREQUAL "split")
                    set(ESMF_NETCDF_LIBS "-lnetcdff -lnetcdf")
                    message(WARNING "ESMF_NETCDF_LIBS implicitly set to '-lnetcdff -lnetcdf'")
                elseif(ESMF_NETCDF STREQUAL "standard")
                    set(ESMF_NETCDF_LIBS "-lnetcdff")
                    message(WARNING "ESMF_NETCDF_LIBS implicitly set to '-lnetcdf'")
                endif()
            endif()
        endif()
        if(NOT DEFINED ESMF_NETCDF_LIBPATH)
            if(DEFINED ENV{ESMF_NETCDF_LIBPATH})
                set(ESMF_NETCDF_LIBPATH "$ENV{ESMF_NETCDF_LIBPATH}")
            else()
                message(WARNING "ESMF_NETCDF_LIBPATH is not explicitly defined")
            endif()
        endif()
    endif()

endif()

    message(STATUS "ESMF_NETCDF_INCLUDE=${ESMF_NETCDF_INCLUDE}")
    message(STATUS "ESMF_NETCDF_LIBS=${ESMF_NETCDF_LIBS}")
    message(STATUS "ESMF_NETCDF_LIBPATH=${ESMF_NETCDF_LIBPATH}")

    message(STATUS "ESMF_NETCDFF_INCLUDE=${ESMF_NETCDFF_INCLUDE}")
    message(STATUS "ESMF_NETCDFF_LIBS=${ESMF_NETCDFF_LIBS}")
    message(STATUS "ESMF_NETCDFF_LIBPATH=${ESMF_NETCDFF_LIBPATH}")

if(DEFINED ESMF_PIO OR DEFINED ENV{ESMF_PIO})
    if(DEFINED ENV{ESMF_PIO})
      set(ESMF_PIO "$ENV{ESMF_PIO}")
    endif()
    if(DEFINED ENV{ESMF_PIO_INCLUDE})
      set(ESMF_PIO_INCLUDE "$ENV{ESMF_PIO_INCLUDE}")
    endif()
    if(DEFINED ENV{ESMF_PIO_LIBPATH})
      string(REPLACE " " ";" ESMF_PIO_LIBPATH "$ENV{ESMF_PIO_LIBPATH}")
    endif()
    if(DEFINED ENV{ESMF_PIO_LIBS})
      string(REPLACE " " ";" ESMF_PIO_LIBS "$ENV{ESMF_PIO_LIBS}")
    endif()
endif()

if(DEFINED ESMF_PNETCDF OR DEFINED ENV{ESMF_PNETCDF})
    if(DEFINED ESMF_PNETCDF)
        message(STATUS "Explicitly set ESMF_PNETCDF takes highest priority. ESMF_PNETCDF=${ESMF_PNETCDF}")
    else()
        message(STATUS "Environment variable ESMF_PNETCDF is defined. ESMF_PNETCDF=$ENV{ESMF_PNETCDF}")
        set(ESMF_PNETCDF "$ENV{ESMF_PNETCDF}")
    endif()

    # define the rest of ESMF_PNETCDF_* variables depending on the value of ESMF_PNETCDF
    # https://earthsystemmodeling.org/docs/release/latest/ESMF_usrdoc/node10.html#sec:netcdf

    if(ESMF_PNETCDF STREQUAL "pnetcdf-config")
        # ESMF_PNETCDF_INCLUDE
        execute_process(COMMAND /bin/sh -c "pnetcdf-config --includedir" OUTPUT_VARIABLE ESMF_PNETCDF_INCLUDE  OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_VARIABLE NC_CONF_ERROR)
        if(NC_CONF_ERROR)
            message(FATAL_ERROR "Executing pnetcdf-config failed: ${NC_CONF_ERROR}")
        endif()

        ### ESMF_PNETCDF_LIBS
        set(ESMF_PNETCDF_LIBS "-lpnetcdf")

        # ESMF_PNETCDF_LIBPATH
        execute_process(COMMAND /bin/sh -c "pnetcdf-config --libdir" OUTPUT_VARIABLE ESMF_PNETCDF_LIBPATH OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_VARIABLE NC_CONF_ERROR)
        if(NC_CONF_ERROR)
            message(FATAL_ERROR "Executing pnetcdf-config failed: ${NC_CONF_ERROR}")
        endif()
    elseif(ESMF_PNETCDF STREQUAL "standard")
        if(NOT DEFINED ESMF_PNETCDF_INCLUDE)
            if(DEFINED ENV{ESMF_PNETCDF_INCLUDE})
                set(ESMF_PNETCDF_INCLUDE "$ENV{ESMF_PNETCDF_INCLUDE}")
            else()
                message(WARNING "ESMF_PNETCDF_INCLUDE is not explicitly defined")
            endif()
        endif()
        if(NOT DEFINED ESMF_PNETCDF_LIBS)
            if(DEFINED ENV{ESMF_PNETCDF_LIBS})
                set(ESMF_PNETCDF_LIBS "$ENV{ESMF_PNETCDF_LIBS}")
            else()
                set(ESMF_PNETCDF_LIBS "-lpnetcdf")
                message(WARNING "ESMF_PNETCDF_LIBS implicitly set to '-lpnetcdf'")
            endif()
        endif()
        if(NOT DEFINED ESMF_PNETCDF_LIBPATH)
            if(DEFINED ENV{ESMF_PNETCDF_LIBPATH})
                set(ESMF_PNETCDF_LIBPATH "$ENV{ESMF_PNETCDF_LIBPATH}")
            else()
                message(WARNING "ESMF_PNETCDF_LIBPATH is not explicitly defined")
            endif()
        endif()
    endif()

endif()

    message(STATUS "")
    message(STATUS "ESMF_PNETCDF_INCLUDE=${ESMF_PNETCDF_INCLUDE}")
    message(STATUS "ESMF_PNETCDF_LIBS=${ESMF_PNETCDF_LIBS}")
    message(STATUS "ESMF_PNETCDF_LIBPATH=${ESMF_PNETCDF_LIBPATH}")
    message(STATUS "")




# Configure Python
find_package(Python 3.6 REQUIRED COMPONENTS Interpreter)
message(STATUS "Found Python: ${Python_EXECUTABLE}")

if(ENABLE_UNIT_TESTS OR ENABLE_SYSTEM_TESTS OR ENABLE_EXAMPLES_TESTS)
    enable_testing()
endif()

add_library(esmf STATIC)

set(BUILD_CONFIG_FILE "${ESMF_OS}.${ESMF_COMPILER}.default")
message(STATUS "BUILD_CONFIG_FILE=${BUILD_CONFIG_FILE}")
if(NOT EXISTS "${CMAKE_SOURCE_DIR}/build_config/${BUILD_CONFIG_FILE}")
    message(FATAL_ERROR "BUILD_CONFIG_FILE=${BUILD_CONFIG_FILE} does not exist")
endif()

set_target_properties(esmf PROPERTIES EXPORT_NAME ESMF)
set_target_properties(esmf PROPERTIES Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod)
target_include_directories(esmf INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/mod>
                                          $<INSTALL_INTERFACE:mod>)
target_include_directories(esmf INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/src/include>
                                          $<INSTALL_INTERFACE:include>)
target_include_directories(esmf INTERFACE $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/build_config/${BUILD_CONFIG_FILE}>)
target_include_directories(esmf INTERFACE $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/src/Infrastructure/stubs/pthread>)

target_include_directories(esmf PRIVATE ${CMAKE_SOURCE_DIR}/src/Infrastructure
                                        ${CMAKE_SOURCE_DIR}/src/Infrastructure/stubs/pthread
                                        ${CMAKE_SOURCE_DIR}/src/Superstructure
                                        ${CMAKE_SOURCE_DIR}/build_config/${BUILD_CONFIG_FILE}
                                        ${CMAKE_CURRENT_BINARY_DIR}/src/include)
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -I${CMAKE_SOURCE_DIR}/src/Infrastructure/stubs/pthread")

if(ESMF_NETCDF)
  target_compile_definitions(esmf PUBLIC ESMF_NETCDF=1)
  target_include_directories(esmf PUBLIC ${ESMF_NETCDF_INCLUDE} ${ESMF_NETCDFF_INCLUDE})
  target_link_directories(esmf PUBLIC ${ESMF_NETCDF_LIBPATH} ${ESMF_NETCDFF_LIBPATH})
  target_link_libraries(esmf PUBLIC ${ESMF_NETCDF_LIBS} ${ESMF_NETCDFF_LIBS})
endif()

if(ESMF_PIO)
  target_compile_definitions(esmf PUBLIC ESMF_PIO=1)
  target_include_directories(esmf PUBLIC ${ESMF_PIO_INCLUDE})
  target_link_directories(esmf PUBLIC ${ESMF_PIO_LIBPATH})
  target_link_libraries(esmf PUBLIC ${ESMF_PIO_LIBS})
endif()

if(ESMF_PNETCDF)
  target_compile_definitions(esmf PUBLIC ESMF_PNETCDF=1)
  target_include_directories(esmf PUBLIC ${ESMF_PNETCDF_INCLUDE})
  target_link_directories(esmf PUBLIC ${ESMF_PNETCDF_LIBPATH})
  target_link_libraries(esmf PUBLIC ${ESMF_PNETCDF_LIBS})
endif()

if(ESMF_NO_INTEGER_1_BYTE)
  target_compile_definitions(esmf PUBLIC ESMF_NO_INTEGER_1_BYTE)
endif()

if(ESMF_NO_INTEGER_2_BYTE)
  target_compile_definitions(esmf PUBLIC ESMF_NO_INTEGER_2_BYTE)
endif()

if(NOT ESMF_OPENMP)
  target_compile_definitions(esmf PUBLIC ESMF_NO_OPENMP)
elseif(${ESMF_OPENMP} STREQUAL "OMP4")
  target_compile_definitions(esmf PUBLIC ESMF_OPENMP4)
endif()

if(NOT ESMF_OPENAACC)
  target_compile_definitions(esmf PUBLIC ESMF_NO_OPENACC)
endif()

if(ESMF_MOAB)
  target_compile_definitions(esmf PUBLIC ESMF_MOAB=1)
endif()

if(ESMF_LAPACK)
   target_compile_definitions(esmf PUBLIC ESMF_LAPACK=1)
   if(ESMF_LAPACK STREQUAL "internal")
      target_compile_definitions(esmf PUBLIC ESMF_LAPACK_INTERNAL=1)
   endif()
endif()

if(ESMF_YAMLCPP)
   target_compile_definitions(esmf PUBLIC ESMF_YAMLCPP=1)
endif()

if(ESMF_TESTEXHAUSTIVE)
   target_compile_definitions(esmf PUBLIC ESMF_TESTEXHAUSTIVE)
endif()

if(ESMF_TESTCOMPTUNNEL)
   target_compile_definitions(esmf PUBLIC ESMF_TESTCOMPTUNNEL)
endif()

if(ESMF_TESTPERFORMANCE)
   target_compile_definitions(esmf PUBLIC ESMF_TESTPERFORMANCE)
endif()

if(ESMF_VERSION_STRING_GIT)
   target_compile_definitions(esmf PUBLIC ESMF_VERSION_STRING_GIT='${ESMF_VERSION_STRING_GIT}')
endif()

if(ESMF_COMM)
   target_compile_definitions(esmf PUBLIC ESMF_COMM=${ESMF_COMM})
   if(ESMF_COMM STREQUAL "mpiuni")
      target_compile_definitions(esmf PUBLIC ESMF_MPIUNI)
      target_include_directories(esmf PRIVATE ${CMAKE_SOURCE_DIR}/src/Infrastructure/stubs/mpiuni)
      target_include_directories(esmf INTERFACE $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/src/Infrastructure/stubs/mpiuni>)
   endif()
endif()

if(ESMF_DIR)
   target_compile_definitions(esmf PUBLIC ESMF_DIR=${ESMF_DIR})
endif()

message(STATUS "ESMF_NO_INTEGER_1_BYTE ... = ${ESMF_NO_INTEGER_1_BYTE}")
message(STATUS "ESMF_NO_INTEGER_2_BYTE ... = ${ESMF_NO_INTEGER_2_BYTE}")
message(STATUS "ESMF_OPENMP .............. = ${ESMF_OPENM}")
message(STATUS "ESMF_OPENAACC ............ = ${ESMF_OPENAACC}")
message(STATUS "ESMF_MOAB ................ = ${ESMF_MOAB}")
message(STATUS "ESMF_LAPACK .............. = ${ESMF_LAPACK}")
message(STATUS "ESMF_YAMLCPP ............. = ${ESMF_YAMLCPP}")
message(STATUS "ESMF_TESTEXHAUSTIVE ...... = ${ESMF_TESTEXHAUSTIVE}")
message(STATUS "ESMF_TESTCOMPTUNNEL ...... = ${ESMF_TESTCOMPTUNNEL}")
message(STATUS "ESMF_TESTPERFORMANCE ..... = ${ESMF_TESTPERFORMANCE}")
message(STATUS "ESMF_VERSION_STRING_GIT .. = ${ESMF_VERSION_STRING_GIT}")
message(STATUS "ESMF_COMM ................ = ${ESMF_COMM}")
message(STATUS "ESMF_MPIRUN .............. = ${ESMF_MPIRUN}")
message(STATUS "ESMF_DIR ................. = ${ESMF_DIR}")

# cmake_print_properties(TARGETS esmf
#                        PROPERTIES
#                            COMPILE_DEFINITIONS
#                            COMPILE_FLAGS
#                            COMPILE_OPTIONS
#                            INTERFACE_INCLUDE_DIRECTORIES
#                            INTERFACE_COMPILE_OPTIONS
#                            INTERFACE_LINK_OPTIONS
#                            INTERFACE_LINK_DIRECTORIES
#                            INTERFACE_LINK_LIBRARIES
#                       )

# Set ESMF_F90COMPILEPATHS
set(ESMF_F90COMPILEPATHS "-I${CMAKE_INSTALL_PREFIX}/mod -I${CMAKE_INSTALL_PREFIX}/include")
get_property(ESMF_INCLUDE_DIRECTORIES TARGET esmf PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
# Remove $<BUILD_INTERFACE:...> and $<INSTALL_INTERFACE:...>
string(REGEX REPLACE "\\$<BUILD_INTERFACE:([^>]+)>" "" cleaned_dirs "${ESMF_INCLUDE_DIRECTORIES}")
string(REGEX REPLACE "\\$<INSTALL_INTERFACE:([^>]+)>" "" cleaned_dirs "${cleaned_dirs}")
# string(REGEX REPLACE "\\$<INSTALL_INTERFACE:([^>]+)>" "\\1" cleaned_dirs "${cleaned_dirs}")
foreach(_ITEM ${cleaned_dirs})
    string(APPEND ESMF_F90COMPILEPATHS " -I${_ITEM}")
endforeach()

# ESMF_CCOMPILEPATHS almost the same as F90. no mod path
set(ESMF_CCOMPILEPATHS "-I${CMAKE_INSTALL_PREFIX}/include")
foreach(_ITEM ${cleaned_dirs})
    string(APPEND ESMF_CCOMPILEPATHS " -I${_ITEM}")
endforeach()

# Set ESMF_F90LINKPATHS
set(ESMF_F90LINKPATHS "-L${CMAKE_INSTALL_PREFIX}/lib")
get_property(ESMF_LINK_DIRECTORIES TARGET esmf PROPERTY INTERFACE_LINK_DIRECTORIES)
foreach(_ITEM ${ESMF_LINK_DIRECTORIES})
    string(APPEND ESMF_F90LINKPATHS " -L${_ITEM}")
endforeach()

# ESMF_CLINKPATHS same as F90
set(ESMF_CLINKPATHS "${ESMF_F90LINKPATHS}")

# Set ESMF_F90LINKLIBS
set(ESMF_F90LINKLIBS "-lesmf")
get_property(ESMF_LINK_LIBS TARGET esmf PROPERTY INTERFACE_LINK_LIBRARIES)
foreach(_ITEM ${ESMF_LINK_LIBS})
    string(APPEND ESMF_F90LINKLIBS " ${_ITEM}")
endforeach()

set(ESMF_CLINKLIBS "${ESMF_F90LINKLIBS}")


add_subdirectory(src)

if(ESMF_NO_POSIXIPC)
   target_compile_definitions(esmf PUBLIC ESMF_NO_POSIXIPC)
else()
   target_link_libraries(esmf PUBLIC rt)
endif()

if(ENABLE_UNIT_TESTS OR ENABLE_SYSTEM_TESTS OR ENABLE_EXAMPLES_TESTS)
    # Create test .config files
    if(ESMF_TESTEXHAUSTIVE)
        set(_TESTS_EXHAUSTIVE "Exhaustive")
    else()
        set(_TESTS_EXHAUSTIVE "Non-exhaustive")
    endif()
    if(ESMF_COMM STREQUAL "mpiuni")
        set(_TESTS_MULTI "Uniprocessor")
    else()
        set(_TESTS_MULTI "Multiprocessor")
    endif()
    configure_file(${CMAKE_SOURCE_DIR}/cmake/unit_tests.config.in
                   ${CMAKE_BINARY_DIR}/tests_rundir/unit_tests.config @ONLY)

    if(ESMF_TESTMPMD)
        set(_TESTS_MPMD "Testmpmd")
    else()
        set(_TESTS_MPMD "Nontestmpmd")
    endif()
    if(ESMF_TESTSHAREDOBJ)
        set(_TESTS_SHAREDOBJ "Testsharedobj")
    else()
        set(_TESTS_SHAREDOBJ "Nontestsharedobj")
    endif()
    if(ESMF_COMM STREQUAL "mpiuni")
        set(_TESTS_MULTI "Uniprocessor")
    else()
        set(_TESTS_MULTI "Multiprocessor")
    endif()
    configure_file(${CMAKE_SOURCE_DIR}/cmake/sys_tests.config.in
                   ${CMAKE_BINARY_DIR}/tests_rundir/sys_tests.config @ONLY)

    if(ESMF_COMM STREQUAL "mpiuni")
        set(_TESTS_MULTI "Uniprocessor")
    else()
        set(_TESTS_MULTI "Multiprocessor")
    endif()
    configure_file(${CMAKE_SOURCE_DIR}/cmake/examples.config.in
                   ${CMAKE_BINARY_DIR}/tests_rundir/examples.config @ONLY)

    # Create check_ctests.sh
    set(TESTS_RUNDIR "${CMAKE_BINARY_DIR}/tests_rundir")
    configure_file(${CMAKE_SOURCE_DIR}/cmake/check_ctests.sh.in
                   ${CMAKE_BINARY_DIR}/tests_rundir/check_ctests.sh @ONLY)

endif()


### Install ESMF library, include/mod files
install(
  TARGETS esmf
  EXPORT ${PROJECT_NAME}Exports
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  PUBLIC_HEADER DESTINATION include)

install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/mod DESTINATION ${CMAKE_INSTALL_PREFIX})
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/src/include DESTINATION ${CMAKE_INSTALL_PREFIX}
        FILES_MATCHING PATTERN "ESMC_*.h"
                       PATTERN "ESMC.h"
                       PATTERN "NUOPC.h")
# install(FILES ${CMAKE_SOURCE_DIR}/build_config/${ESMF_OS}.${ESMF_COMPILER}.${ESMF_SITE}/ESMC_Conf.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
install(FILES ${CMAKE_SOURCE_DIR}/build_config/Linux.gfortran.default/ESMC_Conf.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include)

# addon/ESMX
install(DIRECTORY ${CMAKE_SOURCE_DIR}/src/addon/ESMX DESTINATION ${CMAKE_INSTALL_PREFIX}/include)

# FindESMF.cmake
install(FILES ${CMAKE_SOURCE_DIR}/cmake/FindESMF.cmake DESTINATION ${CMAKE_INSTALL_PREFIX}/cmake)

# esmf.mk
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/esmf.mk.in ${CMAKE_BINARY_DIR}/esmf.mk @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/esmf.mk DESTINATION lib)


### Package config
include(CMakePackageConfigHelpers)

set(CONFIG_INSTALL_DESTINATION lib/cmake/esmf)

export(EXPORT ${PROJECT_NAME}Exports
  NAMESPACE ${PROJECT_NAME}::
  FILE ${CMAKE_BINARY_DIR}/${PROJECT_NAME}Targets.cmake)

# ESMFConfig.cmake
configure_package_config_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/PackageConfig.cmake.in ${CMAKE_BINARY_DIR}/${PROJECT_NAME}Config.cmake
  INSTALL_DESTINATION ${CONFIG_INSTALL_DESTINATION})
install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}Config.cmake
  DESTINATION ${CONFIG_INSTALL_DESTINATION})

# ESMFConfigVersion.cmake
write_basic_package_version_file(
  ${CMAKE_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY AnyNewerVersion)
install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
  DESTINATION ${CONFIG_INSTALL_DESTINATION})

# ESMFTargets.cmake and ESMFTargets-<build-type>.cmake
install(EXPORT ${PROJECT_NAME}Exports
  NAMESPACE ${PROJECT_NAME}::
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION ${CONFIG_INSTALL_DESTINATION})

###############################################################################
### Done
###############################################################################
