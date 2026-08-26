set(SOURCEC ESMCI_LocalArray.C)
set(SOURCEF )
set(STOREH  ESMCI_LocalArray.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
