set(SOURCEC ESMCI_ClumpPnts.C
            ESMCI_MathUtil.C
            ESMCI_Mesh_Glue.C
            ESMCI_FileIO_Util.C
            ESMCI_ESMFMesh_Util.C
            ESMCI_UGRID_Util.C
            ESMCI_Mesh_FileIO.C
            ESMCI_GToM_Util.C
            ESMCI_Mesh_GToM_Glue.C
            ESMCI_Mesh_Vector_Regrid.C
            ESMCI_Mesh_Regrid_Glue.C
            ESMCI_Mesh_XGrid_Glue.C
            ESMCI_Mesh.C
            ESMCI_MeshCap.C
            ESMCI_MeshCXX.C
            ESMCI_MeshDual.C
            ESMCI_MeshRedist.C
            ESMCI_OTree.C
            ESMCI_Regrid_Nearest.C
            ESMCI_Rendez_Nearest.C
            ESMCI_Search_Nearest.C
            ESMCI_Search_NearestNPnts.C
            ESMCI_XGridUtil.C)

if(ESMF_MOAB)
    list(APPEND SOURCEC ESMCI_MBMesh.C
                        ESMCI_MBMesh_BBox.C
                        ESMCI_MBMesh_Bilinear.C
                        ESMCI_MBMesh_Conserve.C
                        ESMCI_MBMesh_Dual.C
                        ESMCI_MBMesh_Extrapolation.C
                        ESMCI_MBMesh_Glue.C
                        ESMCI_MBMesh_GToM_Glue.C
                        ESMCI_MBMesh_Mapping.C
                        ESMCI_MBMesh_Patch.C
                        ESMCI_MBMesh_Redist.C
                        ESMCI_MBMesh_Regrid_Glue.C
                        ESMCI_MBMesh_Rendez_Elem.C
                        ESMCI_MBMesh_Rendez_EtoP.C
                        ESMCI_MBMesh_Search_EtoE.C
                        ESMCI_MBMesh_Search_EtoP.C
                        ESMCI_MBMesh_ShapeFunc.C
                        ESMCI_MBMesh_Util.C)
endif()

set(SOURCEF )
set(STOREH  ESMCI_MeshCXX.h)

if(ESMF_LAPACK STREQUAL internal)
  list(APPEND STOREH  ESMF_LapackBlas.inc)
endif()

copy_storeh()

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/../include)

if(ESMF_MOAB STREQUAL internal)
  set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                               INCLUDE_DIRECTORIES
                              "${CMAKE_CURRENT_SOURCE_DIR}/../include;${CMAKE_CURRENT_SOURCE_DIR}/Moab;${CMAKE_CURRENT_SOURCE_DIR}/Moab/parallel;${CMAKE_CURRENT_SOURCE_DIR}/Moab/LocalDiscretization")

  add_subdirectory(Moab)
endif()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})

add_subdirectory(Legacy)
add_subdirectory(Regridding)
add_subdirectory(Zoltan)

if(ESMF_LAPACK STREQUAL internal)
  add_subdirectory(Lapack)
  add_subdirectory(BLAS)
endif()

