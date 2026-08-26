set(SOURCEC ESMCI_Grid.C)
set(SOURCEF )
set(STOREH  ESMCI_Grid.h ESMC_Grid.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})

if(ESMF_MOAB STREQUAL internal)
  set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                               INCLUDE_DIRECTORIES
                              "${CMAKE_SOURCE_DIR}/src/Infrastructure/Mesh/src/Moab")
endif()
