set(SOURCEC ESMCI_PointList.C)
set(SOURCEF )
set(STOREH  ESMCI_PointList.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
