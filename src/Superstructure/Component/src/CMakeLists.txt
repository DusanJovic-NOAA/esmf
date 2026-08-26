set(SOURCEC ESMCI_FTable.C ESMCI_MethodTable.C ESMCI_CompTunnel.C)
set(SOURCEF ESMF_Comp.F90 ESMF_GridComp.F90 ESMF_CplComp.F90 ESMF_SciComp.F90)
set(STOREH  ESMCI_FTable.h ESMCI_MethodTable.h ESMCI_CompTunnel.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
