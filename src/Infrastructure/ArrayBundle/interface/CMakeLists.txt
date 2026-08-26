set(SOURCEC ESMCI_ArrayBundle_F.C)
set(SOURCEF ESMF_ArrayBundle.F90)

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
