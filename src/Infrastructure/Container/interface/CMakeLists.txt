set(SOURCEC ESMCI_Container_F.C)
set(SOURCEF ESMF_Container.F90)
set(STOREH  ESMCI_Container.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
