set(SOURCEC ESMCI_Array.C)
set(SOURCEF )
set(STOREH  ESMCI_Array.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
