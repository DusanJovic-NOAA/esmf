set(SOURCEC ESMCI_Comp.C ESMC_Comp.C)
set(SOURCEF ESMF_Comp_C.F90)
set(STOREH  ESMCI_Comp.h ESMC_GridComp.h ESMC_CplComp.h ESMC_SciComp.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
