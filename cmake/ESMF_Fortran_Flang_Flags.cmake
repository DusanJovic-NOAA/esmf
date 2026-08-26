set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -g ")

if(ESMF_OPENMP)
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fopenmp")
endif()

set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -O0")

set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -O2")

if(ESMF_COMPILER STREQUAL "aocc")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -DESMF_NO_F2018ASSUMEDTYPE")
endif()

