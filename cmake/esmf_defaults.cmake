include(CheckIncludeFile)
include(CheckSymbolExists)

#-------------------------------------------------------------------------------
# Test for obsolete environment variables, print error and stop build here
#-------------------------------------------------------------------------------

set(OBSOLETE_VARS
    ESMF_ARCH ESMF_PREC ESMF_TOP_DIR ESMF_NODES
    ESMF_C_COMPILER ESMF_C_LIBRARY ESMF_CXX_LIBRARY_PATH
    ESMF_CXX_LIBRARIES ESMF_COMPILER_VERSION ESMF_STDCXX_LIBRARY
    ESMF_F90_LIBRARY_PATH ESMF_F90_LIBRARIES ESMF_NO_LD_LIBRARY_PATH
    ESMF_PROJECT ESMF_LIB_INSTALL ESMF_MOD_INSTALL ESMF_H_INSTALL
    ESMF_NO_IOCODE ESMF_EXHAUSTIVE ESMF_BATCH ESMF_BATCHOPTIONS
    ESMF_MPI ESMF_MPIRUNOPTIONS ESMF_TESTHARNESS
)

foreach(VAR ${OBSOLETE_VARS})
    if(DEFINED ENV{${VAR}})
        message(FATAL_ERROR
            "Obsolete environment variable ${VAR} detected. "
            "Please see ESMF README and/or User's Guide for a current list of ESMF environment variables.")
    endif()
endforeach()

#-------------------------------------------------------------------------------
# Set defaults for environment variables that are not set
#-------------------------------------------------------------------------------

if(DEFINED ESMF_BOPT)
    if(ESMF_BOPT STREQUAL "O" OR ESMF_BOPT STREQUAL "g")
        if(ESMF_BOPT STREQUAL "g")
            set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Set type of build to Debug." FORCE)
        else()
            set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Set type of build to Release." FORCE)
        endif()
    else()
        message(FATAL_ERROR "Not a valid ESMF_BOPT setting.")
    endif()
else()
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        set(ESMF_BOPT "g")
    else()
        set(ESMF_BOPT "O")
    endif()
    if(NOT CMAKE_BUILD_TYPE)
        if(ESMF_BOPT STREQUAL "g")
            set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Set type of build to Debug." FORCE)
        else()
            set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Set type of build to Release." FORCE)
        endif()
    endif()
endif()


set(ESMF_OS ${CMAKE_SYSTEM_NAME})
if(DEFINED ENV{CRAYPE_VERSION})
  message(STATUS "Cray PE detected. Set ESMF_OS to Unicos")
  set(ESMF_OS "Unicos")
endif()

if(NOT DEFINED ESMF_COMPILER)

    # Figure out what ESMF_COMPILER should be based on actual compilers used
    if(    CMAKE_C_COMPILER_ID       STREQUAL "IntelLLVM" AND
           CMAKE_CXX_COMPILER_ID     STREQUAL "IntelLLVM" AND
           CMAKE_Fortran_COMPILER_ID STREQUAL "IntelLLVM")
        set(ESMF_COMPILER "intel")
    elseif(CMAKE_C_COMPILER_ID       STREQUAL "GNU" AND
           CMAKE_CXX_COMPILER_ID     STREQUAL "GNU" AND
           CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
        set(ESMF_COMPILER "gfortran")
    elseif(CMAKE_C_COMPILER_ID       STREQUAL "Clang" AND
           CMAKE_CXX_COMPILER_ID     STREQUAL "Clang" AND
           CMAKE_Fortran_COMPILER_ID STREQUAL "LLVMFlang")
        set(ESMF_COMPILER "llvm")
    elseif(CMAKE_C_COMPILER_ID       STREQUAL "NVHPC" AND
           CMAKE_CXX_COMPILER_ID     STREQUAL "NVHPC" AND
           CMAKE_Fortran_COMPILER_ID STREQUAL "NVHPC")
        set(ESMF_COMPILER "nvhpc")
    elseif(CMAKE_C_COMPILER_ID       STREQUAL "CrayClang" AND
           CMAKE_CXX_COMPILER_ID     STREQUAL "CrayClang" AND
           CMAKE_Fortran_COMPILER_ID STREQUAL "Cray")
        set(ESMF_COMPILER "cce")
    else()
        message(FATAL_ERROR "Unknown ESMF_COMPILER")
    endif()

endif()

set(ESMF_SITE "default")
set(ESMF_MACHINE ${CMAKE_HOST_SYSTEM_PROCESSOR})
set(ESMF_COMM "default") # set later, after MPI package is found

set(ESMF_OPENMP ON)
set(ESMF_OPENACC OFF)
set(ESMF_NO_INTEGER_1_BYTE "default")
set(ESMF_NO_INTEGER_2_BYTE "default")

set(ESMF_MAPPER_BUILD OFF)
set(ESMF_MOAB "internal")
set(ESMF_LAPACK "internal")
set(ESMF_YAMLCPP "internal")

if(NOT DEFINED ESMF_TESTEXHAUSTIVE)
    if(DEFINED ENV{ESMF_TESTEXHAUSTIVE})
        set(ESMF_TESTEXHAUSTIVE "$ENV{ESMF_TESTEXHAUSTIVE}")
    else()
        set(ESMF_TESTEXHAUSTIVE OFF)
    endif()
endif()
set(ESMF_TESTCOMPTUNNEL ON)
set(ESMF_TESTPERFORMANCE ON)

if(NOT DEFINED ESMF_MPIRUN)
    if(DEFINED ENV{ESMF_MPIRUN})
        set(ESMF_MPIRUN "$ENV{ESMF_MPIRUN}")
    else()
        set(ESMF_MPIRUN "mpiexec")
    endif()
endif()

# Check for shm_open function and set ESMF_NO_POSIXIPC
check_include_file("sys/mman.h" HAVE_SYS_MMAN_H)
check_include_file("fcntl.h" HAVE_FCNTL_H)
if(HAVE_SYS_MMAN_H AND HAVE_FCNTL_H)
    set(CMAKE_REQUIRED_LIBRARIES rt)
    check_symbol_exists(shm_open "sys/mman.h;fcntl.h" HAVE_SHM_OPEN)
endif()
set(ESMF_NO_POSIXIPC NOT HAVE_SHM_OPEN)

execute_process(
    COMMAND /bin/sh -c "grep ESMF_VERSION_STRING src/Infrastructure/Util/include/ESMC_Macros.h | sed -e 's/.* \"//' -e 's/\"//'"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    OUTPUT_VARIABLE ESMF_VERSION_STRING
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /bin/sh -c "grep ESMF_VERSION_MAJOR src/Infrastructure/Util/include/ESMC_Macros.h | sed -e 's/.* //'"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    OUTPUT_VARIABLE ESMF_VERSION_MAJOR
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /bin/sh -c "grep ESMF_VERSION_MINOR src/Infrastructure/Util/include/ESMC_Macros.h | sed -e 's/.* //'"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    OUTPUT_VARIABLE ESMF_VERSION_MINOR
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /bin/sh -c "grep ESMF_VERSION_REVISION src/Infrastructure/Util/include/ESMC_Macros.h | sed -e 's/.* //'"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    OUTPUT_VARIABLE ESMF_VERSION_REVISION
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /bin/sh -c "grep ESMF_VERSION_PATCHLEVEL src/Infrastructure/Util/include/ESMC_Macros.h | sed -e 's/.* //'"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    OUTPUT_VARIABLE ESMF_VERSION_PATCHLEVEL
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /bin/sh -c "grep ESMF_VERSION_PUBLIC src/Infrastructure/Util/include/ESMC_Macros.h | sed -e 's/.* //'"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    OUTPUT_VARIABLE ESMF_VERSION_PUBLIC
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /bin/sh -c "grep ESMF_VERSION_BETASNAPSHOT src/Infrastructure/Util/include/ESMC_Macros.h | sed -e 's/.* //'"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    OUTPUT_VARIABLE ESMF_VERSION_BETASNAPSHOT
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND /bin/sh -c "scripts/esmfversiongit"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    OUTPUT_VARIABLE ESMF_VERSION_STRING_GIT
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
