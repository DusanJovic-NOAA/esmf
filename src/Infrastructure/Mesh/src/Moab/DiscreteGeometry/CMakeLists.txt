set(SOURCEC
  DGMSolver.cpp HiReconstruction.cpp)

set(SOURCEF )
set(STOREH  )

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            COMPILE_DEFINITIONS "IS_BUILDING_MB;HAVE_VSNPRINTF;LINUX;USE_MPI")

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            INCLUDE_DIRECTORIES
                           "${CMAKE_CURRENT_SOURCE_DIR}/..;${CMAKE_CURRENT_SOURCE_DIR}/../parallel")

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
