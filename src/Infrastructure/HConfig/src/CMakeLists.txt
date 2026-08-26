set(SOURCEC ESMCI_HConfig.C)
set(SOURCEF )
set(STOREH  ESMCI_HConfig.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
