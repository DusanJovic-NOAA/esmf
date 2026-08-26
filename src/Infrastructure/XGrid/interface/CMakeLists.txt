set(SOURCEC ESMCI_XGrid_F.C ESMCI_XGrid.C ESMC_XGrid.C)
set(SOURCEF ESMF_XGrid_C.F90)
set(STOREH  ESMC_XGrid.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                             INCLUDE_DIRECTORIES
                            "${CMAKE_CURRENT_SOURCE_DIR}/../include")

if(ESMF_MOAB STREQUAL internal)
  set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                               INCLUDE_DIRECTORIES
                              "${CMAKE_CURRENT_SOURCE_DIR}/../include;${CMAKE_SOURCE_DIR}/src/Infrastructure/Mesh/src/Moab")
endif()
