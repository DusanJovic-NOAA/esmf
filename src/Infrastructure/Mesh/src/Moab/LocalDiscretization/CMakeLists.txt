set(SOURCEC
  ElemEvaluator.cpp LinearHex.cpp LinearQuad.cpp
  LinearTet.cpp LinearTri.cpp QuadraticHex.cpp)

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            COMPILE_DEFINITIONS "IS_BUILDING_MB;HAVE_VSNPRINTF;LINUX;USE_MPI")

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            INCLUDE_DIRECTORIES
                           "${CMAKE_CURRENT_SOURCE_DIR}/..")

target_sources(esmf PRIVATE ${SOURCEC})
