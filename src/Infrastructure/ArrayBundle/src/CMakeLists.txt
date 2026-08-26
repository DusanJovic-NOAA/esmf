set(SOURCEC ESMCI_ArrayBundle.C)
set(SOURCEF )
set(STOREH  ESMCI_ArrayBundle.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
