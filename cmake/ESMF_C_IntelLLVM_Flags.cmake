set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -fPIC -debug minimal")

if(ESMF_OPENMP)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -qopenmp")
endif()

set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -Wall -Wextra -Wno-unused -Wno-unused-parameter -Wno-deprecated-literal-operator")

set(CMAKE_C_FLAGS_RELEASE "-O${ESMF_OPTLEVEL}")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O -fp-speculation=safe")
