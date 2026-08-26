
set(SOURCEC	ESMCI_VM_F.C ESMC_VM.C)
set(SOURCEF ESMF_VM.F90)
set(SOURCEH )
set(STOREH  ESMC_VM.h)

copy_storeh()

target_sources(esmf PRIVATE ${SOURCEC} ${SOURCEF})
