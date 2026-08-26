set(SOURCEC ESMCI_PointList_F.C)
set(SOURCEF ESMF_PointList.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})

if(ESMF_MOAB STREQUAL internal)
  set_source_files_properties(${SOURCEC} ${SOURCEF} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                               INCLUDE_DIRECTORIES
                              "${CMAKE_SOURCE_DIR}/src/Infrastructure/Mesh/src/Moab")
endif()
