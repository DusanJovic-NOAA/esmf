set(SOURCEC ESMCI_RHandle.C)
set(SOURCEF )
set(STOREH  ESMCI_RHandle.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
