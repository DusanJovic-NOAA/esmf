set(SOURCEC ESMCI_DELayout.C)
set(SOURCEF )
set(STOREH  ESMCI_DELayout.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
