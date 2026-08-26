set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -g -traceback -fPIC -debug minimal -assume realloc_lhs -m64 -mcmodel=small -pthread -threads")

if(ESMF_OPENMP)
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -qopenmp")
endif()

set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -O0 -check all -check noarg_temp_created -check nopointer -warn -warn noerrors -fstack-protector-all -fpe0 -debug minimal -ftrapuv -init=snan,arrays")

set(CMAKE_Fortran_FLAGS_RELEASE "-O${ESMF_OPTLEVEL}")
set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -fp-speculation=safe")
