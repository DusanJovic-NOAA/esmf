set(SOURCEC
           ESMCI_Conserve2ndInterp.C
           ESMCI_ConserveInterp.C
           ESMCI_ExtrapolationPoleLGC.C
           ESMCI_Integrate.C
           ESMCI_Interp.C
           ESMCI_Mapping.C
           ESMCI_CreepFill.C
           ESMCI_Extrap.C
           ESMCI_MeshRegrid.C
           ESMCI_PatchRecovery.C
           ESMCI_Regrid_Helper.C
           ESMCI_Search.C
           ESMCI_SearchNearestDToSLGC.C
           ESMCI_SearchNearestLGC.C
           ESMCI_SearchNearestNPntsLGC.C
           ESMCI_ShapeFunc.C
           ESMCI_SpaceDir.C
           ESMCI_WMat.C)

if(ESMF_MOAB STREQUAL internal)
  set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                               INCLUDE_DIRECTORIES
                              "${CMAKE_CURRENT_SOURCE_DIR}/../Moab;${CMAKE_CURRENT_SOURCE_DIR}/../Moab/parallel;${CMAKE_CURRENT_SOURCE_DIR}/../Moab/LocalDiscretization")

endif()

target_sources(esmf PRIVATE ${SOURCEC})

