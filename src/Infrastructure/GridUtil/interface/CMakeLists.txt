set(SOURCEC ESMCI_GridUtil_F.C)
set(SOURCEF ESMF_GridUtil.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})

if(ESMF_MOAB STREQUAL internal)
  set_source_files_properties(${SOURCEC} ${SOURCEF} DIRECTORY ${PROJECT_SOURCE_DIR} PROPERTIES INCLUDE_DIRECTORIES
                              "${PROJECT_SOURCE_DIR}/src/Infrastructure/Mesh/src/Moab")
endif()
