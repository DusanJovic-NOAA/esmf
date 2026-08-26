set(SOURCEC ESMCI_DistGrid_F.C ESMC_DistGrid.C)
set(SOURCEF ESMF_DistGridRegDecomp.F90 ESMF_DistGridConnection.F90 ESMF_DistGrid.F90)
set(STOREH  ESMC_DistGrid.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
