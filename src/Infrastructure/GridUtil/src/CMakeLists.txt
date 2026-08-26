set(SOURCEC ESMCI_GridToMesh.C)
set(SOURCEF )
set(STOREH  ESMCI_GridToMesh.h ESMCI_Ptypes.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
