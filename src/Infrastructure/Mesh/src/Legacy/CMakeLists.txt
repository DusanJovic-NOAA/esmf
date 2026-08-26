set(SOURCEC
           ESMCI_Attr.C
           ESMCI_BBox.C
           ESMCI_CommReg.C
           ESMCI_CommRel.C
           ESMCI_Context.C
           ESMCI_DDir.C
           ESMCI_Exception.C
           ESMCI_FieldReg.C
           ESMCI_GeomRendezvous.C
           ESMCI_GlobalIds.C
           ESMCI_HAdapt.C
           ESMCI_IOField.C
           ESMCI_Kernel.C
           ESMCI_MasterElement.C
           ESMCI_MCoord.C
           ESMCI_MEFamily.C
           ESMCI_MEField.C
           ESMCI_MEImprint.C
           ESMCI_MeshDB.C
           ESMCI_MeshExodus.C
           ESMCI_MeshField.C
           ESMCI_MeshGen.C
           ESMCI_MeshllField.C
           ESMCI_MeshMerge.C
           ESMCI_MeshNC.C
           ESMCI_MeshObj.C
           ESMCI_MeshObjConn.C
           ESMCI_MeshObjPack.C
           ESMCI_MeshObjTopo.C
           ESMCI_MeshPartition.C
           ESMCI_MeshPNC.C
           ESMCI_MeshRead.C
           ESMCI_MeshRefine.C
           ESMCI_MeshSkin.C
           ESMCI_MeshUtils.C
           ESMCI_MeshVTK.C
           ESMCI_MEValues.C
           ESMCI_Migrator.C
           ESMCI_ParEnv.C
           ESMCI_ParLog.C
			  ESMCI_Phedra.C
           ESMCI_Polynomial.C
           ESMCI_Quadrature.C
           ESMCI_Rebalance.C
           ESMCI_RefineTopo.C
           ESMCI_SFuncAdaptor.C
           ESMCI_ShapeLagrange.C
           ESMCI_SmallAlloc.C
           ESMCI_SparseMsg.C
           ESMCI_WriteWeights.C
           ESMCI_WriteWeightsPar.C
           ESMCI_FindPnts.C
           ESMCI_SM.C)

set(SOURCEF ESMF_SolverUtil_C.F90)
set(STOREH  )

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            COMPILE_DEFINITIONS "MPICH_IGNORE_CXX_SEEK")

set_source_files_properties(${SOURCEC} DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTIES
                            INCLUDE_DIRECTORIES
                           "${CMAKE_CURRENT_SOURCE_DIR}/..;${CMAKE_CURRENT_SOURCE_DIR}/../Moab;${CMAKE_CURRENT_SOURCE_DIR}/../Moab/parallel;${CMAKE_CURRENT_SOURCE_DIR}/../Moab/LocalDiscretization")


target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
