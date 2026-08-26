
set(SOURCEC	ESMCI_VM.C ESMCI_VMKernel.C)
set(SOURCEF )
set(SOURCEH )
set(STOREH  ESMCI_VM.h ESMCI_VMKernel.h ESMCI_AccInfo.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC})
