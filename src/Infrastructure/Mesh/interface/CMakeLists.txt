set(SOURCEC ESMCI_Mesh_F.C ESMC_Mesh.C)
set(SOURCEF ESMF_Mesh.F90 ESMF_Mesh_C.F90)
set(STOREH  ESMC_Mesh.h)

copy_storeh()

run_cppF90_to_F90()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})

if(ESMF_MOAB STREQUAL internal)
  set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                               INCLUDE_DIRECTORIES
                              "${CMAKE_SOURCE_DIR}/src/Infrastructure/Mesh/src/Moab")
endif()
