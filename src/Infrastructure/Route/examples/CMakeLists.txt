set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/tests_rundir")

# Need to use -fp-model=precise for Intel Fortran compiler to ensure bit-for-bit
# ifeq ($(ESMF_COMPILER),intel)
# ESMF_F90COMPILEOPTS += -fp-model=precise
# else ifeq ($(ESMF_COMPILER),intelgcc)
# ESMF_F90COMPILEOPTS += -fp-model=precise
# endif

if(${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fp-model=precise")
endif()
if(${CMAKE_Fortran_COMPILER_ID} STREQUAL "IntelLLVM")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fp-model=precise")
endif()

esmf_add_test(NAME ESMF_RHandleBitForBitEx
              SOURCES ESMF_RHandleBitForBitEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_RHandleVMEpochEx
              SOURCES ESMF_RHandleVMEpochEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_RHandleFromRHandleEx
              SOURCES ESMF_RHandleFromRHandleEx.F90
              NP 4
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_RHandleFromFileEx
              SOURCES ESMF_RHandleFromFileEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_RHandleReusabilityEx
              SOURCES ESMF_RHandleReusabilityEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")

esmf_add_test(NAME ESMF_RHandleDynamicMaskingEx
              SOURCES ESMF_RHandleDynamicMaskingEx.F90
              NP 4
              MPIUNI
              LABELS "examples_tests")
