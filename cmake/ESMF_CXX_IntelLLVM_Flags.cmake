set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g -traceback -fPIC -debug minimal -m64 -mcmodel=small -pthread")

if(ESMF_OPENMP)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -qopenmp")
endif()

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -Wall -Wextra -Wno-unused -Wno-unused-parameter -Wno-deprecated-literal-operator")

set(CMAKE_CXX_FLAGS_RELEASE "-O${ESMF_OPTLEVEL}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -DNDEBUG -fp-speculation=safe ")
