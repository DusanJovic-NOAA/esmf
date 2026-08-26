set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -g -mcmodel=small -Mallocatable=03 -pthread")

if(ESMF_OPENMP)
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -mp")
endif()

set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -O0")

set(CMAKE_Fortran_FLAGS_RELEASE "-O2")
