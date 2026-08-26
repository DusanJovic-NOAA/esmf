set(SOURCEC ESMCI_DistGrid.C)
set(SOURCEF )
set(STOREH  ESMCI_DistGrid.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
