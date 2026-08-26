set(SOURCEC
  gs.cpp ParallelComm.cpp ParallelData.cpp ParallelMergeMesh.cpp
  ParCommGraph.cpp ProcConfig.cpp ReadParallel.cpp SharedSetData.cpp)

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            COMPILE_DEFINITIONS "IS_BUILDING_MB;HAVE_VSNPRINTF;LINUX;USE_MPI")

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            INCLUDE_DIRECTORIES
                           "${CMAKE_CURRENT_SOURCE_DIR};${CMAKE_CURRENT_SOURCE_DIR}/..")

target_sources(esmf PRIVATE ${SOURCEC})
