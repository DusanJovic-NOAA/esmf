set(SOURCEC ESMCI_Grid_F.C ESMC_Grid.C)
set(SOURCEF ESMF_StaggerLoc.F90 ESMF_Grid.F90 ESMF_Grid_C.F90)
set(STOREH  )

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
